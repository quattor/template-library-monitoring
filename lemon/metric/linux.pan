#
# template pro_monitoring_metrics_linux
#

template monitoring/lemon/metric/linux;


"/system/monitoring/metric/_4115" = nlist(
	"name",	     	"CPUInfo",
	"descr",     	"cpu information: vendor, model, speed, bogomips, physical cpu count and logical cpu count",
	"class",     	"system.CPUInfo",
	"period",    	86400,
	"smooth",    	nlist("typeString", true, "maxtime", 518400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9001" = nlist(
	"name",      	"uptime",
	"descr",     	"the elapsed number of seconds since boot time",
	"class",     	"system.uptime",
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9011" = nlist(
	"name",      	"CPUutil",
	"descr",     	"CPU utilisation in percent over last interval (User, Nice, System, Idle), time interval (seconds), counters discrepencies",
	"class",    	"system.CPUutil",
	"period",    	300,
	"active",   	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9012" = nlist(
	"name",      	"interrupts",
	"descr",     	"number of interrupts during last interval (average per second and total)",
	"class",     	"system.interrupts",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9013" = nlist(
	"name",      	"contextSwitches",
	"descr",     	"number of context switches during last interval (average per second and total)",
	"class",     	"system.contextSwitches",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9022" = nlist(
	"name",      	"swapIO",
	"descr",     	"returns the number of swap pages that have been brought in and out over the last sampling interval expressed in Kilobytes",
	"class",     	"system.swapIO",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9023" = nlist(
	"name",      	"pagingIO",
	"descr",     	"returns the number of pages the system paged in and out over the last sampling interval expressed in Kilobytes",
	"class",     	"system.pagingIO",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9025" = nlist(
	"name",      	"memoryStats",
	"descr",     	"Machine memory usage statistics",
	"class",     	"system.memoryStats",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9031" = nlist(
	"name",      	"existingProcesses",
	"descr",     	"the number of processes existing",
	"class",     	"system.existingProcesses",
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9032" = nlist(
	"name",      	"createdProcesses",
	"descr",     	"the number of processes created in last timeinterval (average per second and total)",
	"class",     	"system.createdProcesses",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9102" = nlist(
	"name",      	"PartitionStatsSummary",
	"descr",     	"returns the size(MB), used(MB), free(MB), read(kB/s), write(kB/s) of all partitions in one sample.",
	"class",     	"system.partitionStatsSummary",
	"period",    	300,
	"active",    	true, 
	"latestonly",	false,
); 

"/system/monitoring/metric/_9103/" = nlist(
	"name",      	"PartitionStats",
	"descr",     	"returns the name, read(kB/s), write(kB/s) for each partition over the last sampling interval (1 sample per partition).",
	"class",     	"system.partitionStats",
	"period",    	300,
	"smooth",    	nlist("typeString", true, "maxtime", 3600, "index", 0, "primarykeys", 1),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9104" = nlist(
	"name",	     	"partitionInfo",
	"descr",     	"returns mountpoint name, type, options, size (MB), used(%), dma status and usrquota status",
	"class",     	"system.partitionInfo",
	"period",    	300,
	"smooth",    	nlist("typeString", true, "maxtime", 3600, "index", 0, "primarykeys", 1),
  	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9200" = nlist(
	"name",	     	"networkInterfaceInfo",
	"descr",     	"returns interface name, address (IP), mask (IP), broadcast (IP), gateway (IP), hardware address (MAC), mtu, duplex (1 = full, 0 = half) and speed (MB/s) of all interfaces on the machine",
	"class",     	"system.networkInterfaceInfo",
	"period",    	21600,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9201" = nlist(
	"name",      	"numberOfSockets",
	"descr",     	"the number of sockets in use (total, TCP, UDP, RAW)",
	"class",     	"system.numberOfSockets",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_9208" = nlist(
	"name",      	"networkInterfaceI0",
	"descr",     	"number of kilobytes read and written (total since boot time and average per second over last sampling interval) for all interfaces",
	"class",     	"system.networkInterfaceIO",
    	"param",     	list("excludes", "lo sit0"),
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);
