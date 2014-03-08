template monitoring/lemon/server/web;

#variable LEMON_NODES_PROPERTIES_TEMPLATE ?= 'pro_nodes_properties';
variable LEMON_NODES_PROPERTIES_TEMPLATE ?= 'site/config/nodes_properties';
variable LEMON_NODES_PROPERTIES_DEFAULT_MONITORING ?= 'yes';

#######################################################
### The machines to be monitored are found via
### the file pro_nodes_properties.tpl
## it should provide (for monitoring) a nlist with following keys: machine name, nlist with keys type and monitoring
## if monitoring is absent, it's assumed to be LEMON_NODES_PROPERTIES_DEFAULT
## example:
## variable NODES_PROPS  = nlist(
## 		escape("machine1.example.com"), nlist("type","WN","monitoring","yes"),
##      );   
include { return(LEMON_NODES_PROPERTIES_TEMPLATE); };


## possible types: MON,WN,CE,SE_DISK,BDII,NFS

#######################################################
variable NODES_TYPE = {
	nodes_type = nlist();
	nodes_props = NODES_PROPS;
	ok = first(nodes_props, k, v);
	while (ok) {
		answer = LEMON_NODES_PROPERTIES_DEFAULT_MONITORING;
		if (exists(v["monitoring"])) {
			answer = v["monitoring"];
		};
		if ( match(answer, 'yes') ) { 
			nodes_type = merge(nodes_type,nlist(k,v["type"]));
		};
		ok = next(nodes_props, k, v);
	};
	
	nodes_type;
};



##################  
   ##############Pour distinguer WNs et MACHINE DE SERVICES  
     
   ##CLUSTER WN  
   ############  
    variable NODES_WN = {  
           nodes_wn = list();  
           nodes_type = NODES_TYPE;  
     ok = first(nodes_type,k,v);  
     
   while (ok) {  
           answer = v;  
          if ( match(v, 'WN') ) {  
           nodes_wn[length(nodes_wn)] = k;  
           nodes_wn = merge(nodes_wn);  
   };  
   ok = next(nodes_type, k, v);  
   };  
   return(nodes_wn);  
   };  
     
   ##CLUSTER GRID SERVICES (CE, SE ..)  
   ###################################  
    variable NODES_SERVICE = {  
           nodes_service = list();  
           nodes_type = NODES_TYPE;  
     ok = first(nodes_type,k,v);  
     
   while (ok) {  
          answer = v;  
           if ( !match(v, 'WN') ) {  
           nodes_service[length(nodes_service)] = k;  
           nodes_service = merge(nodes_service);  
   };  
   ok = next(nodes_type, k, v);  
   };  
   return(nodes_service);  
   };  
     





# This variable can be used to generate "superclusters" that
# aggregate nodes of different types e.g.
# nlist("GATEWAY",list("CE","SE_DISK"))
variable LEMON_SUPERCLUSTERS ?= nlist();

# here we generate a hash mapping the clusters to the list of nodes they contain 
variable LEMON_CLUSTERS = {
    res=nlist();
    # scan NODES_TYPE for different cluster types
    foreach (cnode; ctype; NODES_TYPE) {
        if (exists(res[ctype])) {
            res[ctype]=merge(res[ctype],list(cnode));     
        }
        else {
            res[ctype]=list(cnode);
        };
        # now we go through the superclusters and check
        # whether the basic node type (e.g. CE) is included
        # in a particular supercluster (e.g. GATEWAY)
        foreach (spcname; sbcname; LEMON_SUPERCLUSTERS) {
           # if type is in the list of subclusters
           if (index(ctype,sbcname)!=-1) {
               if (exists(res[spcname])) {
                   res[spcname]=merge(res[spcname],list(cnode));     
               }
               else {
                   res[spcname]=list(cnode);
               };  
           };
        };          
    };        
    res;
};




#######
variable LIST_NODES = {
         nodes = list();
         nodes_type = NODES_TYPE;
ok = first(nodes_type, k, v);
while (ok) {
	nodes[length(nodes)] = k;
	ok = next(nodes_type, k, v);
};
return(nodes);
};

#######
variable STRING_NODES = {
list_nodes = LIST_NODES;
res = "";
  ok = first(list_nodes,index,node);
  while(ok) {
	nodestring = node;
	result =  matches(nodestring,'^([a-zA-Z0-9]+)(([_])(\w+))?$');
	nodestringshort=to_string(result[1]);
	#res = res + "\n" + nodestringshort;
	res = res + unescape(nodestring) + "\n" ;
	ok = next(list_nodes,index,node);
};
return(res);
};


function list_to_string = {
	function_name = 'list_to_string';
    if (! (ARGC == 1) ) {
      error(function_name+' requires 1 arguments');
    };

	lis = ARGV[0];
	if (! is_list(lis)) {
		error(function_name+' requires a list as argument');
	};

	r = '';
	ok = first(lis,index,value);
    while(ok) {
        r = r + unescape(value);
        ok = next(lis,index,value);
        if (ok) {
        	r = r + ",";
        };
	};
	
	r;
};

# scan through the clusters and output the cluster groups for
# lemon-web config 
variable CONTENTS_CLUSTERS = {
    res='';
    nodes_service = NODES_SERVICE; 
    res = res + "[GRID_SERVICES]" + "\n" +"hosts="+ list_to_string(nodes_service) + "\n" + "name=GRID_SERVICES" + "\n";
	foreach (ctype; cnodes; LEMON_CLUSTERS) {
        res = res + "["+ctype+"]\nhosts="+ list_to_string(cnodes) + "\nname="+ctype+"\n";    
    };
    res;
};


# ---------------------------------------------------------------------------- 
# filecopy
# ---------------------------------------------------------------------------- 
include { 'components/filecopy/config' };


############ Liste des machines monitorees ################
# /var/spool/edg-fmon-server/nodes.map

"/software/components/filecopy/services" =
  npush(escape("/var/spool/edg-fmon-server/nodes.map"),
        nlist("config",STRING_NODES,
              "owner","lemon",
              "perms","0664"));



############ Liste des clusters ################
#  /etc/lemon/lrf/clusters.conf

"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/lrf/clusters.conf"),
        nlist("config",CONTENTS_CLUSTERS,
              "owner","root",
              "perms","0644"));




############ LEMONMRD ################
#  /etc/lemon/lemonmrd.conf
variable LEMON_SOURCE_AUTH ?= '';

variable CONTENTS_LEMONMRD = <<EOF;
[root]
root_dir=/usr/lib/lrf
data_dir=/var/www/html/lrf/data
loop_time=120
cluster_files=/etc/lemon/lrf/clusters.conf
EOF

variable CONTENTS_LEMONMRD = CONTENTS_LEMONMRD + "source_type="+LEMON_BACKEND+"\n";
variable CONTENTS_LEMONMRD = CONTENTS_LEMONMRD + "source_auth="+LEMON_SOURCE_AUTH+"\n";

variable CONTENTS_LEMONMRD = CONTENTS_LEMONMRD + <<EOF;
default_metrics=XROOT_USE,XVAR_USE,XTMP_USE,LOADAVG,NUMBEROFUSERS,CPUUTILPERCUSER,CPUUTILPERCNICE,CPUUTILPERCSYSTEM,CPUUTILPERCIDLE,EXISTINGPROCESSES,AVRINTERRUPTSPERSEC,NUMKBREADAVG,NUMKBWRITEAVG,TOTALNUMSOCKETSINUSE,TOTALPAGINGREADPERSEC,TOTALPAGINGWRITEPERSEC,DISK_FREE,DISK_USED,DISKKBREADRATE,DISKKBWRITERATE,SWAP_SPACE_USED,CACHED_MEM_SIZE,BUFFERED_MEM_SIZE,SHARED_MEM_SIZE,MEM_SPACE_FREE,MEM_SPACE_USED,SWAP_IN_USE,MEM_IN_USE,TOTALSWAPPAGESREADPERSEC,TOTALSWAPPAGESWRITEPERSEC,AVGNUMPROCESSESCREATED,CPUUTILPERCIOWAIT,CPUUTILPERCIRQ,CPUUTILPERCSOFTIRQ
default_time=600

[metric_map]
XROOT_USE=partitionInfo:PartitionUsedPerc?Mountpoint=/
XVAR_USE=partitionInfo:PartitionUsedPerc?Mountpoint=/var
XTMP_USE=partitionInfo:PartitionUsedPerc?Mountpoint=/tmp
XHOME_USE=partitionInfo:PartitionUsedPerc?Mountpoint=/home
XPOOL_USE=partitionInfo:PartitionUsedPerc?Mountpoint=/pool
LOADAVG=LoadAvg:LOADAVG
NUMBEROFUSERS=NumberOfUsers:NUMBEROFUSERS
CPUUTILPERCUSER=CPUutil:PercUser
CPUUTILPERCSYSTEM=CPUutil:PercSystem
CPUUTILPERCNICE=CPUutil:PercNice
CPUUTILPERCIDLE=CPUutil:PercIdle
CPUUTILPERCIOWAIT=CPUutil:PercIOWait
CPUUTILPERCIRQ=CPUutil:PercIRQ
CPUUTILPERCSOFTIRQ=CPUutil:PercSoftIRQ
EXISTINGPROCESSES=existingProcesses:ExistingProcesses
AVGNUMPROCESSESCREATED=createdProcesses:AVGNUMPROCESSESCREATED
AVRINTERRUPTSPERSEC=interrupts:AvrInterruptsperSec
NUMKBREADAVG=networkIO_eth0:NUMKBREADAVG
NUMKBWRITEAVG=networkIO_eth0:NUMKBWRITEAVG
TOTALNUMSOCKETSINUSE=numberOfSockets:TOTALNUMSOCKETSINUSE
TOTALPAGINGREADPERSEC=pagingIO:TotalPagingReadsPerSec
TOTALPAGINGWRITEPERSEC=pagingIO:TotalPagingWritesPerSec
DISK_USED=PartitionStatsSummary:TotalPartitionSizeUsed
DISK_FREE=PartitionStatsSummary:TotalPartitionSizeFree
DISKKBREADRATE=PartitionStatsSummary:TotalPartitionReadRate
DISKKBWRITERATE=PartitionStatsSummary:TotalPartitionWriteRate
SWAP_SPACE_USED=memoryStats:SWAP_SPACE_USED
SWAP_SPACE_FREE=memoryStats:SWAP_SPACE_FREE
CACHED_MEM_SIZE=memoryStats:CACHED_MEM_SIZE
BUFFERED_MEM_SIZE=memoryStats:BUFFERED_MEM_SIZE
SHARED_MEM_SIZE=memoryStats:SHARED_MEM_SIZE
MEM_SPACE_FREE=memoryStats:MEM_SPACE_FREE
MEM_SPACE_USED=memoryStats:MEM_SPACE_USED
SWAP_IN_USE=memoryStats:SWAP_IN_USE
MEM_IN_USE=memoryStats:MEM_IN_USE
TOTALSWAPPAGESREADPERSEC=swapIO:TotalSwapReadsPerSec
TOTALSWAPPAGESWRITEPERSEC=swapIO:TotalSwapWritesPerSec
ETH1READAVG=networkIO_eth1:NUMKBREADAVG
ETH1WRITEAVG=networkIO_eth1:NUMKBWRITEAVG
ETH2READAVG=networkIO_eth2:NUMKBREADAVG
ETH2WRITEAVG=networkIO_eth2:NUMKBWRITEAVG
ETH3READAVG=networkIO_eth3:NUMKBREADAVG
ETH3WRITEAVG=networkIO_eth3:NUMKBWRITEAVG
ETH4READAVG=networkIO_eth4:NUMKBREADAVG
ETH4WRITEAVG=networkIO_eth4:NUMKBWRITEAVG
ETH5READAVG=networkIO_eth5:NUMKBREADAVG
ETH5WRITEAVG=networkIO_eth5:NUMKBWRITEAVG
ETH6READAVG=networkIO_eth6:NUMKBREADAVG
ETH6WRITEAVG=networkIO_eth6:NUMKBWRITEAVG
ETH7READAVG=networkIO_eth7:NUMKBREADAVG
ETH7WRITEAVG=networkIO_eth7:NUMKBWRITEAVG
RunningJobs=Jobsrunning:Running_Jobs
WaitingJobs=Jobsrunning:Waiting_Jobs
BdiiStatus=BdiiStatus:BDIISTATUS
BdiiLoad=BdiiLoad:BDIILOAD
BdiiSlapd=BdiiSlapd:BDIISLAPD
NfsCalls=NfsCalls:Calls
NfsPacketLost=NfsPacketLost:PacketLost
NfsThreads=NfsThreads:Threads

[metrics_for_clusters]
default=average
NUMKBREADAVG=average,sum
NUMKBWRITEAVG=average,sum
ETH1WRITEAVG=average,sum
ETH1READAVG=average,sum
ETH2WRITEAVG=average,sum
ETH2READAVG=average,sum
#
#
[SE_DISK]
type=cluster
metrics=+ETH1READAVG,+ETH1WRITEAVG,+ETH2READAVG,+ETH2WRITEAVG,+ETH3READAVG,+ETH3WRITEAVG,+ETH4READAVG,+ETH4WRITEAVG,+ETH5READAVG,+ETH5WRITEAVG,+ETH6READAVG,+ETH6WRITEAVG,+ETH7READAVG,+ETH7WRITEAVG

[WN]
type=cluster
metrics=+XHOME_USE


[CE]
type=cluster
metrics=+RunningJobs,+WaitingJobs

[SITE_BDII]
type=cluster
metrics=+BdiiStatus,+BdiiLoad,+BdiiSlapd

[TOP_BDII]
type=cluster
metrics=+BdiiStatus,+BdiiLoad,+BdiiSlapd


[NFS]
type=cluster
metrics=+ETH1READAVG,+ETH1WRITEAVG,+NfsCalls,+NfsPacketLost,+NfsThreads




EOF


############ lemonmrd ################
#  /etc/lemon/lemonmrd.conf

"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/lemonmrd.conf"),
        nlist("config",CONTENTS_LEMONMRD,
              "owner","apache",
              "perms","0600"));
