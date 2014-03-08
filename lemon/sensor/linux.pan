#
# pro_monitoring_sensor_linux
#
# This file contains the sensor definition for the linux sensor
#
template monitoring/lemon/sensor/linux;

# command line
"/system/monitoring/sensor/linux/cmdline" = "/usr/libexec/sensors/lemon-sensor-linux";

# additional protocols the sensor supports
"/system/monitoring/sensor/linux/supports" = "CFG SOD CHK VER";

# to be run as user root by default
#"/system/monitoring/sensor/linux/user" = "root";

# class definitions
"/system/monitoring/sensor/linux/class" = list(
	nlist("name", "system.existingProcesses", 
		"descr", "the number of processes existing",
		"field", list(
			nlist("name", "ExistingProcesses", "format", "%ld", "scale", 1.0, "unit", "count"),)
	),

    	nlist("name", "system.createdProcesses",
          	"descr", "the number of processes created in last time interval (average per second and total)",
	      	"field", list(
			nlist("name", "AvgNumProcessesCreated",   "format", "%.2f"),
                       	nlist("name", "TotalNumProcessesCreated", "format", "%ld", "scale", 1.0, "unit", "count"),)
        ),
	
     	nlist("name", "system.numberOfUsers",
          	"descr", "numbers of users active (ie. with processes) on the machine",
	      	"field", list(
			nlist("name", "NumberOfUsers", "format", "%ld", "unit", "count", "scale", 1.0),)
    	),

    	nlist("name", "system.numberOfSockets",
          	"descr", "the number of sockets in use (total, TCP, UDP, RAW)",
	      	"field", list(
			nlist("name", "TotalNumSocketsInUse", "format", "%ld", "scale", 1.0, "unit", "count"),
                       	nlist("name", "TCPNumSocketsInUse",   "format", "%ld", "scale", 1.0, "unit", "count"),
                       	nlist("name", "UDPNumSocketsInUse",   "format", "%ld", "scale", 1.0, "unit", "count"),
                       	nlist("name", "RAWNumSocketsInUse",   "format", "%ld", "scale", 1.0, "unit", "count"),)
     	),

    	nlist("name", "system.uptime",
          	"descr", "the elapsed number of seconds since boot time",
	      	"field", list(
			nlist("name", "system.uptime", "format", "%ld", "scale", 1.0, "unit", "seconds"),)
       	),

	nlist("name", "system.CPUInfo",
		"descr", "returns vendor, model, speed, bogomips, the number of physical and the number of logical cpus",
		"field", list(
			nlist("name", "Vendor",	  	  "format", "%40s"),
			nlist("name", "Model",    	  "format", "%70s"),
			nlist("name", "Speed",    	  "format", "%ld"),
			nlist("name", "Bogomips", 	  "format", "%ld"),
			nlist("name", "PhysicalCPUCount", "format", "%ld"),
			nlist("name", "LogicalCPUCount",  "format", "%ld"),)
	),

    	nlist("name", "system.CPUutil",
          	"descr", "returns CPU utilisation in percent over last interval (User, Nice, System, Idle, IOWait, IRQ, SoftIRQ, time interval (seconds), counter discrepancies",
	      	"field", list(
			nlist("name", "PercUser",             "format", "%.2f"),
                       	nlist("name", "PercNice",             "format", "%.2f"),
                       	nlist("name", "PercSystem",           "format", "%.2f"),
                       	nlist("name", "PercIdle",             "format", "%.2f"),
			nlist("name", "PercIOWait",           "format", "%.2f"),
			nlist("name", "PercIRQ",              "format", "%.2f"),
			nlist("name", "PercSoftIRQ",          "format", "%.2f"),
                       	nlist("name", "TimeInterval" ,        "format", "%.2f"),
                       	nlist("name", "CounterDiscrepancies", "format", "%ld"),)
     	),

    	nlist("name", "system.CPUCount",
         	"descr", "the number of processors in the machine, as seen by the OS",
	      	"field", list(
			nlist("name", "NumberOfCpus", "format", "%ld", "unit", "count", "scale", 1.0, "descr", "Number Of Processes"),),
      	),

  	nlist("name", "system.networkInterfaceIO",
          	"descr", "returns the number of kilobytes read and written (total since boot time and average per second over the last sampling interval) on all interfaces",
	  	"field", list(
			nlist("name", "InterfaceName",   "format", "%10s", "primary", true),
			nlist("name", "NumKBReadTotal",  "format", "%ld",  "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "NumKBReadAvg",    "format", "%.2f", "scale", 1024.0, "unit", "bytes/sec"),
                       	nlist("name", "NumKBWriteTotal", "format", "%ld",  "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "NumKBWriteAvg",   "format", "%.2f", "scale", 1024.0, "unit", "bytes/sec"),)
       	),

    	nlist("name", "system.contextSwitches",
          	"descr", "number of context switches during last interval (average per second and total)",
	      	"field", list(
			nlist("name", "AvgContextSwitchesPerSec",   "format", "%.2f"),
                       	nlist("name", "TotalContextSwitchesPerSec", "format", "%ld", "scale", 1.0),),
    	),

    	nlist("name", "system.memoryStats",
          	"descr", "Machine memory usage statistics",
	      	"field", list(
			nlist("name", "swap_space_free",   "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "swap_space_used",   "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "cached_mem_size",   "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "buffered_mem_size", "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "shared_mem_size",   "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "mem_space_free",    "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "mem_space_used",    "format", "%ld", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "swap_in_use",       "format", "%.2f"),
                       	nlist("name", "mem_in_use",        "format", "%.2f"),
			nlist("name", "commit_limit",      "format", "%ld", "scale", 1024.0, "unit", "bytes", "default", "-1"),
			nlist("name", "committed_as",      "format", "%ld", "scale", 1024.0, "unit", "bytes", "default", "-1")
		)
	),

    	nlist("name", "system.swapIO",
 		"descr", "returns the number of swap pages that have been brought in and out over the last sampling interval expressed in Kilobytes. The format returns: average in (KB/s), total in (KB), average out (KB/s), total out (KB)",
	      	"field", list(
			nlist("name", "AvgSwapReadsPerSec",    "format", "%.2f", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "TotalSwapReadsPerSec",  "format", "%ld",  "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "AvgSwapWritesPerSec",   "format", "%.2f", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "TotalSwapWritesPerSec", "format", "%ld",  "scale", 1024.0, "unit", "bytes"),)
	),

    	nlist("name", "system.pagingIO",
          	"descr", "returns the number of pages the system paged in and out over the last sampling interval expressed in Kilobytes. The format returns: average in (KB/s), total in (KB), average out (KB/s), total out (KB)",
	      	"field", list(
			nlist("name", "AvgPagingReadsPerSec",    "format", "%.2f", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "TotalPagingReadsPerSec",  "format", "%ld",  "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "AvgPagingWritesPerSec",   "format", "%.2f", "scale", 1024.0, "unit", "bytes"),
                       	nlist("name", "TotalPagingWritesPerSec", "format", "%ld",  "scale", 1024.0, "unit", "bytes"),)
	),

    	nlist("name", "system.bootTime",
          	"descr", "time of the last reboot",
	      	"field", list(
			nlist("name", "BootTime", "format", "%ld", "scale", 1.0, "unit", "seconds"),)
	),

    	nlist("name", "system.loadAvg",
          	"descr", "1-minute load average",
	      	"field", list(
			nlist("name", "LoadAvg", "format", "%.1f"),)
	),

    	nlist("name", "system.memoryShared",
          	"descr", "the size of the shared memory",
	     	"field", list(
			nlist("name", "SharedMemory", "format", "%ld", "scale", 1.0, "unit", "bytes"),)
	),

	nlist("name", "system.networkInterfaceInfo",
		"descr", "returns interface name, address (IP), mask (IP), broadcast (IP), gateway (IP), hardware address (MAC), mtu, duplex (1 = full, 0 = half) and speed (MB/s) of all interfaces on the machine",
		"field", list(
			nlist("name", "InterfaceName", "format", "%32s", "primary", true),
			nlist("name", "IPAddress",     "format", "%32s"),
			nlist("name", "Mask",	       "format", "%32s"),
			nlist("name", "Broadcast",     "format", "%32s"),
			nlist("name", "Gateway",       "format", "%32s"),
			nlist("name", "MAC",	       "format", "%32s"),
			nlist("name", "MTU",	       "format", "%ld"),
			nlist("name", "Duplex",	       "format", "%ld", "descr", "1 = full - 0 = half"),
			nlist("name", "Speed",	       "format", "%ld", "scale", 1024.0, "unit", "bytes"),)
	),

	nlist("name", "system.Os",
		"descr", "returns name, release and version of the operating system",
		"field", list(
			nlist("name", "OS",            "format", "%32s"),
			nlist("name", "KernelVersion", "format", "%32s"),
			nlist("name", "Architecture",  "format", "%32s"),
			nlist("name", "Distribution",  "format", "%100s"),)
	),

	nlist("name", "system.partitionInfo",
		"descr", "returns mountpoint name, type, options, size (MB), used(%), dma status, usrquota status, inode usage(%) and writeable status",
		"field", list(
			nlist("name", "Mountpoint",        "format", "%50s", "primary", true),
			nlist("name", "PartitionType",     "format", "%32s"),
			nlist("name", "Options",           "format", "%128s"),
			nlist("name", "PartitionSize",     "format", "%ld", "scale", 1048576.0, "unit", "bytes"),
		   	nlist("name", "PartitionUsedPerc", "format", "%ld"),	
			nlist("name", "DMA",               "format", "%ld", "descr", "1 = enabled - 0 = disabled"),
			nlist("name", "UsrQuota",          "format", "%ld", "descr", "-1 = missing, 0 = not ok, 1 = ok"),
		   	nlist("name", "InodesUsedPerc",    "format", "%ld", "default", "-1"),
			nlist("name", "IsWriteable",       "format", "%ld", "default", "-1"),)
	),

	nlist("name", "system.interrupts",
        	"descr", "number of interrupts during last interval (average per second and total)",
	      	"field", list(
			nlist("name", "AvrInterruptsPerSec",   "format", "%.2f"),
                       	nlist("name", "TotalInterruptsPerSec", "format", "%ld", "scale", 1.0),)
	),

	nlist("name", "system.partitionStats",
		"descr", "returns the name, read(kB/s), write(kB/s) for each partition over the last sampling interval (1 sample per partition).",
	      	"field", list(
		    	nlist("name", "PartitionName",      "format", "%15s" , "primary", true),
                       	nlist("name", "PartitionReadRate" , "format", "%10.1f", "scale", 1024.0, "unit", "bytes/sec"),
                       	nlist("name", "PartitionWriteRate", "format", "%10.1f", "scale", 1024.0, "unit", "bytes/sec" ),)
	),

	nlist("name", "system.partitionStatsSummary",
		"descr", "returns size(MB), used(MB), free(MB), read(kB/s), write(kB/s) of all partitions in one sample.",
		"field", list(
			nlist("name", "TotalPartitionSize",      "format", "%ld",    "scale", 1048576.0, "unit", "bytes"),
                       	nlist("name", "TotalPartitionSizeUsed",  "format", "%ld",    "scale", 1048576.0, "unit", "bytes"),
                       	nlist("name", "TotalPartitionSizeFree",  "format", "%ld",    "scale", 1048576.0, "unit", "bytes"),
                       	nlist("name", "TotalPartitionReadRate",  "format", "%10.1f", "scale", 1024.0,    "unit", "bytes/sec"),
                       	nlist("name", "TotalPartitionWriteRate", "format", "%10.1f", "scale", 1024.0,    "unit", "bytes/sec"),)
 	),

	nlist("name", "system.diskStats",
		"descr", "returns name, read(kB/s), write(kB/s), use(%) for each disk over last interval",
		"field", list(
			nlist("name", "DiskName",      "format", "%15s",   "primary", true),
                       	nlist("name", "DiskReadRate",  "format", "%10.1f", "scale", 1024.0, "unit", "bytes/sec"),
                       	nlist("name", "DiskWriteRate", "format", "%10.1f", "scale", 1024.0, "unit", "bytes/sec"),
                       	nlist("name", "DiskUsedPerc",  "format", "%ld"),)
 	),

 	nlist("name", "system.processCount",
		"descr", "returns the number of processes matching the user specified criteria",
	      	"field", list(
			nlist("name", "NumberOfProcesses", "format", "%ld", "unit", "count", "scale", 1.0),)
        ),

 	nlist("name", "system.processFDCount",
		"descr", "returns the total number and average number of open file descriptors that a collection of processes has",
	      	"field", list(
			nlist("name", "TotalNumFileDescriptors", "format", "%ld"),
			nlist("name", "AvgNumFileDescriptors",   "format", "%ld"),
			nlist("name", "ProcessCount", 	         "format", "%ld"),)
        ),
	
	nlist("name", "system.processMemory",
		"descr", "returns memory statistics in kilobytes for a group of processes matching the user specified criteria",
		"field", list(
			nlist("name", "ProccessName", "format", "%32s", "primary", true),
			nlist("name", "ProcessCount", "format", "%ld"),
			nlist("name", "TotalVSZ",     "format", "%ld", "unit", "bytes", "scale", 1024.0),
			nlist("name", "TotalRSS",     "format", "%ld", "unit", "bytes", "scale", 1024.0),
			nlist("name", "TotalSZ",      "format", "%ld", "unit", "bytes", "scale", 1024.0),)
	),

 	nlist("name", "system.processUptime",
		"descr", "returns the uptime in seconds of a process matching the user specified criteria",
	      	"field", list(
			nlist("name", "Uptime", "format", "%ld", "unit", "seconds", "scale", 1.0),)
        ),

	nlist("name", "system.swapUsed",
		"descr", "returns the percentage of swap space used.",
		"field", list(
	  		nlist("name", "SwapUsed", "format", "%.1f"),)
	),

	nlist("name", "system.exitCode",
		"descr", "returns the exit code of a given command.",
		"field", list(
			nlist("name", "ExitCode", "format", "%ld"),)
	),

	nlist("name", "system.unmountedFilesystems",
		"descr", "returns the number of XFS, EXT* and SWAP file systems which are reported in /etc/fstab but not mounted",
		"field", list(
			nlist("name", "UnmountedFilesystems", "format", "%ld"),)
	),	

	# To be decommissioned
 	nlist("name", "system.numberOfProcesses",
		"descr", "the number of processes for given process",
	      	"field", list(
			nlist("name", "NumberOfProcesses", "format", "%ld", "unit", "count", "scale", 1.0),)
        ),
);


# End-of-File
