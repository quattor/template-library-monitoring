template monitoring/lemon/sensor/script/nfs;


include { 'components/filecopy/config' };


variable CONTENT_SM = <<EOF;
#!/usr/bin/perl -w

package NfsStatus;

use strict;
# the sensor API interface
use sensorAPI;


# register module name and version
registerVersion("lemon-sensor-NfsStatus", "1.01.1.1");

#
# register the sensors metric classes
#
registerMetric("NfsStatus.Calls", "Bad calls/ calls", "NfsStatus::Calls");
registerMetric("NfsStatus.PacketLost", "Packet Lost", "NfsStatus::PacketLost");
registerMetric("NfsStatus.Threads", "the last 4 thread were 100% busy during this time ", "NfsStatus::Threads");
registerMetric("NfsStatus.RpcPortmap", "Portmap running ? ", "NfsStatus::RpcPortmap");
registerMetric("NfsStatus.RpcNlockmgr", "nlockmgr running ? ", "NfsStatus::RpcNlockmgr");
registerMetric("NfsStatus.RpcRquotad", "nlockmgr running ? ", "NfsStatus::RpcRquotad");
registerMetric("NfsStatus.RpcMountd", "mountd running ? ", "NfsStatus::RpcMountd");
registerMetric("NfsStatus.RpcNfs", "nfs running ? ", "NfsStatus::RpcNfs");



#Bad calls/ calls
#################
sub Calls_sample() {

        my $obj  = shift;
        my $nfsstatus;
        my @nfstat;
        my $badcalls;
        my $calls;
        my $res;

                 $nfsstatus = `/usr/sbin/nfsstat -s | head -3 | tail -1 |  cut -d '-' -f2`;
                         @nfstat = split(/ /, $nfsstatus);
                          $badcalls = $nfstat[3];
                         $calls = $nfstat[0];
                 $res=$badcalls/$calls;

                        $obj->storeSample01($res);

    return 0;
      }

####Packet Lost
###############
sub PacketLost_sample (){

         my $obj  = shift;

                my $pl = `head -2 /proc/net/snmp | cut -d' ' -f17 | tail -1`;

                        $obj->storeSample01($pl);
  return 0;
}

####the last 4 thread were 100% busy during this time
#####################################################

sub Threads_sample (){
        my $obj  = shift;


                my $t8 = `grep th /proc/net/rpc/nfsd |  cut -d' ' -f13 | cut -d '.' -f1`;
                my $t7 = `grep th /proc/net/rpc/nfsd |  cut -d' ' -f12 | cut -d '.' -f1`;
                my $t6 = `grep th /proc/net/rpc/nfsd |  cut -d' ' -f11 | cut -d '.' -f1`;
                my $t5 = `grep th /proc/net/rpc/nfsd |  cut -d' ' -f10 | cut -d '.' -f1`;

                my $T=($t5 + $t6 + $t7 + $t8);

                        $obj->storeSample01 ($T);
  return 0;
}

####Portmap running
###################
sub RpcPortmap_sample (){

         my $obj  = shift;

                my $rp = `rpcinfo -p | grep portmap | wc -l`;

                        $obj->storeSample01($rp);
  return 0;
}

####nlockmgr running
###################
sub RpcNlockmgr_sample (){

         my $obj  = shift;

                my $rn = `rpcinfo -p | grep nlockmgr | wc -l`;

                        $obj->storeSample01($rn);
  return 0;
}


####rquotad running
###################
sub RpcRquotad_sample (){

         my $obj  = shift;

                my $rr = `rpcinfo -p | grep rquotad | wc -l`;

                        $obj->storeSample01($rr);
  return 0;
}

####mountd running
###################
sub RpcMountd_sample (){

         my $obj  = shift;

                my $rm = `rpcinfo -p | grep mountd | wc -l`;

                        $obj->storeSample01($rm);
  return 0;
}

####NFS running
###################
sub RpcNfs_sample (){

         my $obj  = shift;

                my $rnfs = `rpcinfo -p | grep nfs | wc -l`;

                        $obj->storeSample01($rnfs);
  return 0;
}







1;





__END__


#-- End-of-File --------------------------------------------------------------------------------------#

EOF



"/software/components/filecopy/services" = npush(
        escape("/usr/libexec/sensors/NfsStatus.pm"),
        nlist("config",CONTENT_SM,
        	  "restart","/etc/init.d/edg-fmon-agent restart",
              "owner","root",
              "perms","0644")
    );
