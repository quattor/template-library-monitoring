template monitoring/lemon/server/OraMon/oramon;

include { 'components/chkconfig/config' };
# Start OraMon-server

"/software/components/chkconfig/service/OraMon/on" = "";
"/software/components/chkconfig/service/OraMon/startstop" = true;

variable ORAMON_SOAP_PORT ?= 12410;

# ---------------------------------------------------------------------------- 
# filecopy
# ---------------------------------------------------------------------------- 
include { 'components/filecopy/config' };

### OraMon config file
variable CONTENTS = <<EOF;
SERVER_OPTIONS=""

. /etc/profile.d/oracle_env.sh

EOF
"/software/components/filecopy/services" =
  npush(escape("/etc/sysconfig/OraMon"),
        nlist("config",CONTENTS,
              "restart","/etc/init.d/OraMon restart",
              "perms","0644"));

variable CONTENTS_ORAMON = <<EOF;
###############################################
#
MR
	Attributes
		version 0.0.2
	CommonFields
		nodename
			Type CHAR
			PrimaryKey
			FieldLength 256
		timestamp
			Type INTEGER
			PrimaryKey
	MetricClasses
		Chk3Ware
			Description Problem with 3-Ware RAID setup
			Fields
				Chk3Ware
					Type CHAR
					FieldLength 250
		DMA
			Description Is DMA enabled on the IDE disks?
			Fields
				DMA
					Type INTEGER
		MSA.Alive
			Description The first number return is always "1" (can be used as a heart beat). Then follows the number of running sensors out of the number that should be running (x y).
			Fields
				HeartBeat
					Type INTEGER
					Description the number "1"
				RunningSensors
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description actual number of running sensors
				TotalSensors
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description desired number of running sensors
		MSA.CleanLocalCache
			Description Remove old files from MSA local spool
			Fields
				MSA_CleanLocalCache
					Type INTEGER
		MSA.Footprint
			Description CPU + Memory consumption of MSA + Sensors
			Fields
				AgentUptime
					Type INTEGER
					Description agent uptime (1/100th second)
				TotalCpuUsed
					Type INTEGER
					Description total cpu used (1/100th second)
				AgentCPUOverLastInterval
					Type FLOAT
					Description agent resources used : cpu over last interval
				AgentVsize
					Type INTEGER
					Description agent resources used : vsize (kB)
				AgentRss
					Type INTEGER
					Description agent resources used : rss (kB)
				AgentMemUsed
					Type FLOAT
					Description agent resources used : %mem used
				SensorsCPUOverLastInterval
					Type FLOAT
					Description sensors resources used (total): cpu over last interval
				SensorsVsize
					Type INTEGER
					Description sensors resources used (total): vsize (kB)
				SensorsRss
					Type INTEGER
					Description sensors resources used (total): rss (kB)
				SensorsMemUsed
					Type FLOAT
					Description sensors resources used (total): %mem used
		MSA.HeartBeatTimeout
			Description Time out value for heartbeat
			Fields
				MSA_HeartBeatTimeout
					Type INTEGER
		MSA.HostnameCheck
			Description Consistancy check to make sure the agent identifier is the same as the machine name
			Fields
				HostnameCheck
					Type INTEGER
		MSA.LogStats
			Description Returns log statistics for the agent and its sensors over the last sampling period
			Fields
				Info
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description number of info messages
				Warn
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description number of warning messages
				Error
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description number of error messages
				Fatal
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description number of fatal messages. Note: fatal messages are only recorded for sensors as messages of this type for the agent would cause a shutdown
		MSA.SensorCheck
			Description Check sensor responsiveness
			Fields
				UnresponsiveSensors
					Type INTEGER
					Description The number of sensors that were unresponsive to the agents CHK request
				CheckedSensors
					Type INTEGER
					Description The number of sensors checked
		MSA.SensorVersions
			Description Returns the versions of the sensor/modules running under the agent
			Fields
				SensorName
					Type CHAR
					FieldLength 64
				ModuleName
					Type CHAR
					FieldLength 64
				Version
					Type CHAR
					FieldLength 15
		MSA.Version
			Description MSA Monitoring Sensor Agent version
			Fields
				MSA_Version
					Type CHAR
					FieldLength 20
		SharedMemory
			Description the size of the shared memory
			Fields
				SharedMemory
					Type INTEGER
		alarm.exception
			Description exception monitoring class
			Fields
				exceptstate
					Type INTEGER
				code
					Type CHAR
					FieldLength 10
				freetxt
					Type CHAR
					FieldLength 256
		dummy
			Description LAS supermetric class
			Fields
				active
					Type CHAR
					FieldLength 10
		file.dump
			Description dumps given file content (line by line) when initialized and further data written to it
			Fields
				FileData
					Type CHAR
					FieldLength 2000
		file.filecount
			Description returns the number of files within a given directory based on the criteria specified at initialisation
			Fields
				FileCount
					Type INTEGER
		file.filesystemUse
			Description usage of the file system as a percentage of the total size
			Fields
				FileSystemUse
					Type FLOAT
		file.md5sum
			Description md5 checksum of the file
			Fields
				FileMD5Sum
					Type CHAR
					FieldLength 32
		file.size
			Description size of the file in kilobytes
			Fields
				FileSize
					Type INTEGER
					MetricUnit bytes
					MetricScale 1
		file.spaceUsed
			Description returns the space used of a given directory and its sub-directories in bytes
			Fields
				UsedSpace
					Type FLOAT
					MetricUnit bytes
		file.sslmtime
			Description returns the number of seconds since the file was last modified or -1 if the file does not exist.
			Fields
				Seconds
					Type INTEGER
		log.Parse
			Description returns a count of the number of lines matching the specified user criteria within a log file
			Fields
				count
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description Number of matching log entries
		system.CPUCount
			Description the number of processors in the machine, as seen by the OS
			Fields
				NumberOfCpus
					Type INTEGER
					MetricUnit count
					MetricScale 1
					Description Number Of Processes
		system.CPUInfo
			Description returns vendor, model, speed, bogomips, the number of physical and the number of logical cpus
			Fields
				Vendor
					Type CHAR
					FieldLength 40
				Model
					Type CHAR
					FieldLength 70
				Speed
					Type INTEGER
				Bogomips
					Type INTEGER
				PhysicalCPUCount
					Type INTEGER
				LogicalCPUCount
					Type INTEGER
		system.CPUutil
			Description returns CPU utilisation in percent over last interval (User, Nice, System, Idle, IOWait, IRQ, SoftIRQ, time interval (seconds), counter discrepancies
			Fields
				PercUser
					Type FLOAT
				PercNice
					Type FLOAT
				PercSystem
					Type FLOAT
				PercIdle
					Type FLOAT
				PercIOWait
					Type FLOAT
				PercIRQ
					Type FLOAT
				PercSoftIRQ
					Type FLOAT
				TimeInterval
					Type FLOAT
				CounterDiscrepancies
					Type INTEGER
		system.Os
			Description returns name, release and version of the operating system
			Fields
				OS
					Type CHAR
					FieldLength 32
				KernelVersion
					Type CHAR
					FieldLength 32
				Architecture
					Type CHAR
					FieldLength 32
				Distribution
					Type CHAR
					FieldLength 100
		system.bootTime
			Description time of the last reboot
			Fields
				BootTime
					Type INTEGER
					MetricUnit seconds
					MetricScale 1
		system.contextSwitches
			Description number of context switches during last interval (average per second and total)
			Fields
				AvgContextSwitchesPerSec
					Type FLOAT
				TotalContextSwitchesPerSec
					Type INTEGER
					MetricScale 1
		system.createdProcesses
			Description the number of processes created in last time interval (average per second and total)
			Fields
				AvgNumProcessesCreated
					Type FLOAT
				TotalNumProcessesCreated
					Type INTEGER
					MetricUnit count
					MetricScale 1
		system.existingProcesses
			Description the number of processes existing
			Fields
				ExistingProcesses
					Type INTEGER
					MetricUnit count
					MetricScale 1
		system.exitCode
			Description returns the exit code of a given command.
			Fields
				ExitCode
					Type INTEGER
		system.interrupts
			Description number of interrupts during last interval (average per second and total)
			Fields
				AvrInterruptsPerSec
					Type FLOAT
				TotalInterruptsPerSec
					Type INTEGER
					MetricScale 1
		system.loadAvg
			Description 1-minute load average
			Fields
				LoadAvg
					Type FLOAT
		system.memoryShared
			Description the size of the shared memory
			Fields
				SharedMemory
					Type INTEGER
					MetricUnit bytes
					MetricScale 1
		system.memoryStats
			Description Machine memory usage statistics
			Fields
				swap_space_free
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				swap_space_used
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				cached_mem_size
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				buffered_mem_size
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				shared_mem_size
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				mem_space_free
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				mem_space_used
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				swap_in_use
					Type FLOAT
				mem_in_use
					Type FLOAT
		system.networkIO
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface 
			Fields
				NumKBReadTotal
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				NumKBReadAvg
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
				NumKBWriteTotal
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				NumKBWriteAvg
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
		system.networkInterfaceIO
			Description returns the number of kilobytes read and written (total since boot time and average per second over the last sampling interval) on all interfaces
			Fields
				InterfaceName
					Type CHAR
					FieldLength 10
					PrimaryKey
				NumKBReadTotal
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				NumKBReadAvg
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
				NumKBWriteTotal
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				NumKBWriteAvg
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
		system.networkInterfaceInfo
			Description returns interface name, address (IP), mask (IP), broadcast (IP), gateway (IP), hardware address (MAC), mtu, duplex (1 = full, 0 = half) and speed (MB/s) of all interfaces on the machine
			Fields
				InterfaceName
					Type CHAR
					FieldLength 32
					PrimaryKey
				IPAddress
					Type CHAR
					FieldLength 32
				Mask
					Type CHAR
					FieldLength 32
				Broadcast
					Type CHAR
					FieldLength 32
				Gateway
					Type CHAR
					FieldLength 32
				MAC
					Type CHAR
					FieldLength 32
				MTU
					Type INTEGER
				Duplex
					Type INTEGER
					Description 1 = full - 0 = half
				Speed
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
		system.numberOfProcesses
			Description the number of processes for given process
			Fields
				NumberOfProcesses
					Type INTEGER
					MetricUnit count
					MetricScale 1
		system.numberOfSockets
			Description the number of sockets in use (total, TCP, UDP, RAW)
			Fields
				TotalNumSocketsInUse
					Type INTEGER
					MetricUnit count
					MetricScale 1
				TCPNumSocketsInUse
					Type INTEGER
					MetricUnit count
					MetricScale 1
				UDPNumSocketsInUse
					Type INTEGER
					MetricUnit count
					MetricScale 1
				RAWNumSocketsInUse
					Type INTEGER
					MetricUnit count
					MetricScale 1
		system.numberOfUsers
			Description numbers of users active (ie. with processes) on the machine
			Fields
				NumberOfUsers
					Type INTEGER
					MetricUnit count
					MetricScale 1
		system.pagingIO
			Description returns the number of pages the system paged in and out over the last sampling interval expressed in Kilobytes. The format returns: average in (KB/s), total in (KB), average out (KB/s), total out (KB)
			Fields
				AvgPagingReadsPerSec
					Type FLOAT
					MetricUnit bytes
					MetricScale 1024
				TotalPagingReadsPerSec
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				AvgPagingWritesPerSec
					Type FLOAT
					MetricUnit bytes
					MetricScale 1024
				TotalPagingWritesPerSec
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
		system.partitionInfo
			Description returns mountpoint name, type, options, size (MB), used(%), dma status, usrquota status and inodes use(%)
			Fields
				Mountpoint
					Type CHAR
					FieldLength 50
					PrimaryKey
				PartitionType
					Type CHAR
					FieldLength 32
				Options
					Type CHAR
					FieldLength 32
				PartitionSize
					Type INTEGER
					MetricUnit bytes
					MetricScale 1048580
				PartitionUsedPerc
					Type INTEGER
				DMA
					Type INTEGER
					Description 1 = enabled - 0 = disabled
				UsrQuota
					Type INTEGER
					Description -1 = missing, 0 = not ok, 1 = ok
				InodesUsedPerc
					Type INTEGER
		system.partitionStats
			Description returns the name, read(kB/s), write(kB/s) for each partition over the last sampling interval (1 sample per partition).
			Fields
				PartitionName
					Type CHAR
					FieldLength 15
					PrimaryKey
				PartitionReadRate
					Type FLOAT
				PartitionWriteRate
					Type FLOAT
		system.partitionStatsSummary
			Description returns size(MB), used(MB), free(MB), read(kB/s), write(kB/s) of all partitions in one sample.
			Fields
				TotalPartitionSize
					Type INTEGER
					MetricUnit bytes
					MetricScale 1048580
				TotalPartitionSizeUsed
					Type INTEGER
					MetricUnit bytes
					MetricScale 1048580
				TotalPartitionSizeFree
					Type INTEGER
					MetricUnit bytes
					MetricScale 1048580
				TotalPartitionReadRate
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
				TotalPartitionWriteRate
					Type FLOAT
					MetricUnit bytes/sec
					MetricScale 1024
		system.processUptime
			Description returns the uptime in seconds of a process matching the user specified criteria
			Fields
				Uptime
					Type INTEGER
					MetricUnit seconds
					MetricScale 1
		system.swapIO
			Description returns the number of swap pages that have been brought in and out over the last sampling interval expressed in Kilobytes. The format returns: average in (KB/s), total in (KB), average out (KB/s), total out (KB)
			Fields
				AvgSwapReadsPerSec
					Type FLOAT
					MetricUnit bytes
					MetricScale 1024
				TotalSwapReadsPerSec
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
				AvgSwapWritesPerSec
					Type FLOAT
					MetricUnit bytes
					MetricScale 1024
				TotalSwapWritesPerSec
					Type INTEGER
					MetricUnit bytes
					MetricScale 1024
		system.swapUsed
			Description returns the percentage of swap space used.
			Fields
				SwapUsed
					Type FLOAT
		system.uptime
			Description the elapsed number of seconds since boot time
			Fields
				system_uptime
					Type INTEGER
					MetricUnit seconds
					MetricScale 1
		torque_maui.RunningJobs
			Description Running jobs on the CE?
			Fields
				Running_Jobs
					Type INTEGER
					MetricUnit count
					MetricScale 1
				Waiting_Jobs
					Type INTEGER
					MetricUnit count
					MetricScale 1
		GridBdii.BdiiStatus
			Description BDII status
			Fields
				BdiiStatus
					Type INTEGER
					MetricUnit count
					MetricScale 1
		GridBdii.BdiiLoad
			Description BDII Load
			Fields
				BdiiLoad
					Type INTEGER
					MetricUnit count
					MetricScale 1
		GridBdii.BdiiSlapd
			Description BDII slapd process equal 3
			Fields
				BdiiSlapd
					Type INTEGER
					MetricUnit count
					MetricScale 1
		NfsStatus.Calls
			Description Bad calls/ calls
			Fields
				Calls
					Type FLOAT
		NfsStatus.PacketLost
			Description Packet Lost
			Fields
				PacketLost
					Type INTEGER
					MetricUnit count
					MetricScale 1
		NfsStatus.Threads
			Description the last 4 thread were 100% busy during this time
			Fields
				Threads
					Type INTEGER
					MetricUnit count
					MetricScale 1
		NfsStatus.RpcNfs
			Description NFS problem ?
			Fields
				NfsRpcNfs
					Type INTEGER
					MetricUnit count
					MetricScale 1
		NfsStatus.RpcMountd
			Description NFS problem ?
			Fields
				NfsRpcMountd
					Type INTEGER
					MetricUnit count
		NfsStatus.RpcPortmap
			Description NFS problem ?
			Fields
				NfsRpcPortmap
					Type INTEGER
					MetricUnit count
					MetricUnit count
		NfsStatus.RpcRquotad
			Description NFS problem ?
			Fields
				NfsRpcRquotad
					Type INTEGER
					MetricUnit count
					MetricUnit count
		NfsStatus.RpcNlockmgr
			Description NFS problem ?
			Fields
				NfsRpcNlockmgr
					Type INTEGER
					MetricUnit count
					MetricUnit count
	Metrics
		0
			MetricClass dummy
			MetricName LAS0
			Description LAS supermetric
			TableName _0
			LatestOnly
		31
			MetricClass system.numberOfProcesses
			MetricName squid
			Description squid daemon
			TableName _31
			LatestOnly
		32
			MetricClass system.numberOfProcesses
			MetricName cupsd
			Description cups daemon
			TableName _32
		37
			MetricClass system.numberOfProcesses
			MetricName zephyrd
			Description The zephyr Daemon
			TableName _37
		40
			MetricClass system.numberOfProcesses
			MetricName tomcat
			Description tomcat running processes
			TableName _40
		43
			MetricClass system.numberOfProcesses
			MetricName crond
			Description The should be one, and only one, crond daemon running
			TableName _43
		44
			MetricClass system.numberOfProcesses
			MetricName named
			Description "named" daemon
			TableName _44
			LatestOnly
		50
			MetricClass system.numberOfProcesses
			MetricName lpd
			Description "lpd" Line Printer daemon
			TableName _50
		4001
			MetricClass system.numberOfProcesses
			MetricName snmpd
			Description "snmpd" SNMP daemon
			TableName _4001
		4003
			MetricClass system.numberOfProcesses
			MetricName klogd
			Description "klogd" kernel logger daemon
			TableName _4003
			LatestOnly
		4006
			MetricClass system.numberOfProcesses
			MetricName sshd
			Description "sshd" SSH daemon
			TableName _4006
		4008
			MetricClass system.numberOfProcesses
			MetricName atd
			Description "atd" daemon
			TableName _4008
			LatestOnly
		4012
			MetricClass system.numberOfProcesses
			MetricName sendmail
			Description "sendmail" daemon
			TableName _4012
			LatestOnly
		4013
			MetricClass system.numberOfProcesses
			MetricName portmap
			Description "portmap" daemon
			TableName _4013
			LatestOnly
		4014
			MetricClass system.numberOfProcesses
			MetricName syslogd
			Description "syslogd" daemon
			TableName _4014
			LatestOnly
		4016
			MetricClass system.numberOfProcesses
			MetricName MSAd
			Description Number of MSA processes running
			TableName _4016
			LatestOnly
		4017
			MetricClass system.numberOfProcesses
			MetricName nfsd
			Description NFS daemon
			TableName _4017
		4018
			MetricClass system.numberOfProcesses
			MetricName xfsd
			Description X Font Server
			TableName _4018
		4019
			MetricClass system.numberOfProcesses
			MetricName httpd
			Description the Apache httpd daemon
			TableName _4019
		4022
			MetricClass system.numberOfProcesses
			MetricName smartd
			Description The should be one, and only one, smart daemon running
			TableName _4022
		4102
			MetricClass system.memoryShared
			MetricName SharedMemory
			Description the size of the shared memory
			TableName _4102
		4105
			MetricClass system.numberOfUsers
			MetricName NumberOfUsers
			Description numbers of users active (ie. with processes) on the machine
			TableName _4105
		4107
			MetricClass system.numberOfProcesses
			MetricName zombies
			Description the number of zombie processes
			TableName _4107
		4109
			MetricClass system.Os
			MetricName OS
			Description returns name, release and version of the operating system
			TableName _4109
		4111
			MetricClass system.CPUCount
			MetricName NumberOfCpus
			Description the number of processors
			TableName _4111
		4115
			MetricClass system.CPUInfo
			MetricName CPUInfo
			Description cpu information: vendor, model, speed, bogomips, physical cpu count and logical cpu count
			TableName _4115
		4301
			MetricClass system.numberOfProcesses
			MetricName oramon
			Description the OraMon Measurement Repository server
			TableName _4301
		4302
			MetricClass file.sslmtime
			MetricName oramon_heartbeat_age
			Description Heartbeat age of the OraMon Measurement Repository server
			TableName _4302
		4303
			MetricClass system.processUptime
			MetricName oramon_uptime
			Description The uptime of the OraMon Measurement Repository server process
			TableName _4303
		5003
			MetricClass file.size
			MetricName nologin.size
			Description size of file "/etc/nologin"
			TableName _5003
		5004
			MetricClass file.size
			MetricName iss_nologin.size
			Description size of file "/etc/iss.nologin"
			TableName _5004
		5013
			MetricClass system.bootTime
			MetricName BootTime
			Description Time of last reboot
			TableName _5013
		5026
			MetricClass system.numberOfProcesses
			MetricName xinetd
			Description "xinetd" daemon
			TableName _5026
			LatestOnly
		5030
			MetricClass system.numberOfProcesses
			MetricName rpc_statd
			Description "rpc.statd" daemon
			TableName _5030
			LatestOnly
		5032
			MetricClass system.numberOfProcesses
			MetricName nscd
			Description "nscd" daemon
			TableName _5032
			LatestOnly
		5033
			MetricClass system.numberOfProcesses
			MetricName ntpd
			Description "ntpd" daemon
			TableName _5033
		5034
			MetricClass file.md5sum
			MetricName sshd.md5sum
			Description MD5 sum of the "ssh" binary
			TableName _5034
		5037
			MetricClass file.size
			MetricName ld.so.preload.exist
			Description /etc/ld.so.preload present
			TableName _5037
		5121
			MetricClass log.Parse
			MetricName KernelPanic
			Description Has the kernel panicked?
			TableName _5121
		5122
			MetricClass log.Parse
			MetricName VM_kill
			Description Processes killed because of memory problems
			TableName _5122
		5125
			MetricClass log.Parse
			MetricName UncorrectableError
			Description "UncorrectableError" reported in /var/log/messages?!
			TableName _5125
		5127
			MetricClass log.Parse
			MetricName MachineCheckException
			Description Are there Machine Check Exception reported in /var/log/messages?
			TableName _5127
		5128
			MetricClass log.Parse
			MetricName SerialCardError
			Description Are there serial card errors reported in /var/log/messages?
			TableName _5128
		5129
			MetricClass system.numberOfProcesses
			MetricName consoled
			Description the "consoled" daemon
			TableName _5129
		5130
			MetricClass log.Parse
			MetricName IO_error
			Description Are there I/O errors reported in /var/log/messages?
			TableName _5130
		5131
			MetricClass log.Parse
			MetricName FileSystem_error
			Description Are there filesystem errors (Ext2, Ext3, XFS) reported in /var/log/messages?
			TableName _5131
		5133
			MetricClass log.Parse
			MetricName Ext2FsWarning
			Description EXT-fs error
			TableName _5133
		9001
			MetricClass system.uptime
			MetricName uptime
			Description the elapsed number of seconds since boot time
			TableName _9001
		9011
			MetricClass system.CPUutil
			MetricName CPUutil
			Description CPU utilisation in percent over last interval (User, Nice, System, Idle), time interval (seconds), counters discrepencies
			TableName _9011
		9012
			MetricClass system.interrupts
			MetricName interrupts
			Description number of interrupts during last interval (average per second and total)
			TableName _9012
		9013
			MetricClass system.contextSwitches
			MetricName contextSwitches
			Description number of context switches during last interval (average per second and total)
			TableName _9013
		9022
			MetricClass system.swapIO
			MetricName swapIO
			Description returns the number of swap pages that have been brought in and out over the last sampling interval expressed in Kilobytes
			TableName _9022
		9023
			MetricClass system.pagingIO
			MetricName pagingIO
			Description returns the number of pages the system paged in and out over the last sampling interval expressed in Kilobytes
			TableName _9023
		9024
			MetricClass system.numberOfProcesses
			MetricName rfiod_total
			Description count the total number of "rfiod" daemons running
			TableName _9024
		9025
			MetricClass system.memoryStats
			MetricName memoryStats
			Description Machine memory usage statistics
			TableName _9025
		9031
			MetricClass system.existingProcesses
			MetricName existingProcesses
			Description the number of processes existing
			TableName _9031
		9032
			MetricClass system.createdProcesses
			MetricName createdProcesses
			Description the number of processes created in last timeinterval (average per second and total)
			TableName _9032
		9102
			MetricClass system.partitionStatsSummary
			MetricName PartitionStatsSummary
			Description returns the size(MB), used(MB), free(MB), read(kB/s), write(kB/s) of all partitions in one sample.
			TableName _9102
		9103
			MetricClass system.partitionStats
			MetricName PartitionStats
			Description returns the name, read(kB/s), write(kB/s) for each partition over the last sampling interval (1 sample per partition).
			TableName _9103
		9104
			MetricClass system.partitionInfo
			MetricName partitionInfo
			Description returns mountpoint name, type, options, size (MB), used(%), dma status and usrquota status
			TableName _9104
		9200
			MetricClass system.networkInterfaceInfo
			MetricName networkInterfaceInfo
			Description returns interface name, address (IP), mask (IP), broadcast (IP), gateway (IP), hardware address (MAC), mtu, duplex (1 = full, 0 = half) and speed (MB/s) of all interfaces on the machine
			TableName _9200
		9201
			MetricClass system.numberOfSockets
			MetricName numberOfSockets
			Description the number of sockets in use (total, TCP, UDP, RAW)
			TableName _9201
		9202
			MetricClass system.networkIO
			MetricName networkIO_eth0
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth0")
			TableName _9202
		9203
			MetricClass system.networkIO
			MetricName networkIO_lo
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "lo")
			TableName _9203
		9204
			MetricClass system.networkIO
			MetricName networkIO_eth1
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth1")
			TableName _9204
		9205
			MetricClass system.networkIO
			MetricName networkIO_eth2
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth2")
			TableName _9205
		9206
			MetricClass system.networkIO
			MetricName networkIO_eth3
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth3")
			TableName _9206
		9207
			MetricClass system.networkIO
			MetricName networkIO_eth4
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth4")
			TableName _9207
		9208
			MetricClass system.networkInterfaceIO
			MetricName networkInterfaceI0
			Description number of kilobytes read and written (total since boot time and average per second over last sampling interval) for all interfaces
			TableName _9208
		9209
			MetricClass system.networkIO
			MetricName networkIO_eth5
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth5")
			TableName _9209
		9210
			MetricClass system.networkIO
			MetricName networkIO_eth6
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth6")
			TableName _9210
		9211
			MetricClass system.networkIO
			MetricName networkIO_eth7
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "eth7")
			TableName _9211
		9301
			MetricClass system.networkIO
			MetricName networkIO_myri0
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: "myri0")
			TableName _9301
		9311
			MetricClass system.networkIO
			MetricName networkIO_ipoib0
			Description number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: ipoib0)
			TableName _9311
		10000
			MetricClass MSA.Version
			MetricName MSAVersion
			Description MSA Monitoring Sensor Agent version
			TableName _10000
		10001
			MetricClass MSA.CleanLocalCache
			MetricName MSA.CleanLocalCache
			Description Remove old files from MSA local spool
			TableName _10001
		10002
			MetricClass MSA.SensorVersions
			MetricName SensorVersions
			Description Returns the versions of the sensor/modules running under the agent
			TableName _10002
		10003
			MetricClass MSA.Alive
			MetricName alive
			Description The first number return is always "1" (can be used as a heart beat). Then follows the number of running sensors out of the number that should be running (x y)
			TableName _10003
			LatestOnly
		10004
			MetricClass MSA.Footprint
			MetricName footprint
			Description CPU + Memory consumption of MSA + Sensors
			TableName _10004
		10005
			MetricClass MSA.HeartBeatTimeout
			MetricName HeartBeatTimeout
			Description Time out value for heartbeat
			TableName _10005
			LatestOnly
		10006
			MetricClass MSA.SensorCheck
			MetricName SensorCheck
			Description Check sensor responsiveness
			TableName _10006
		10007
			MetricClass MSA.LogStats
			MetricName LogStats
			Description Returns log statistics for the agent and its sensors over the last sampling period
			TableName _10007
		10008
			MetricClass MSA.HostnameCheck
			MetricName HostnameCheck
			Description Consistancy check to make sure the agent identifier is the same as the machine name
			TableName _10008
		20002
			MetricClass system.loadAvg
			MetricName LoadAvg
			Description 1-minute load average
			TableName _20002
		20003
			MetricClass system.swapUsed
			MetricName SwapUsed
			Description Swap space used [%]
			TableName _20003
		20044
			MetricClass file.filecount
			MetricName CrashDump
			Description Are there crash dumps on the system?
			TableName _20044
		20046
			MetricClass DMA
			MetricName DMA
			Description Is DMA enabled on the IDE disks?
			TableName _20046
		20047
			MetricClass torque_maui.RunningJobs 
			MetricName Jobsrunning
			Description Running Jobs on the CE?
			TableName _20047
		20048
			MetricClass GridBdii.BdiiStatus 
			MetricName BdiiStatus
			Description BDII status
			TableName _20048
		20049
			MetricClass GridBdii.BdiiLoad
			MetricName BdiiLoad
			Description BDII  Load
			TableName _20049
		20050
			MetricClass GridBdii.BdiiSlapd
			MetricName BdiiSlapd
			Description BDII slapd number of process equal 3?
			TableName _20050
		20151
			MetricClass NfsStatus.Calls
			MetricName NfsCalls
			Description Bad calls/ calls
			TableName _20151
		20152
			MetricClass NfsStatus.PacketLost
			MetricName NfsPacketLost
			Description Packet Lost
			TableName _20152
		20153
			MetricClass NfsStatus.Threads
			MetricName NfsThreads
			Description the last 4 thread were 100% busy during this time
			TableName _20153
		20154
			MetricClass NfsStatus.RpcNfs
			MetricName NfsRpcNfs
			Description NFS running
			TableName _20154
		20155
			MetricClass NfsStatus.RpcMountd
			MetricName NfsRpcMountd
			Description mountd running
			TableName _20155
		20156
			MetricClass NfsStatus.RpcPortmap
			MetricName NfsRpcPortmap
			Description portmap running
			TableName _20156
		20157
			MetricClass NfsStatus.RpcRquotad
			MetricName NfsRpcRquotad
			Description rquotad running
			TableName _20157
		20158
			MetricClass NfsStatus.RpcNlockmgr
			MetricName NfsRpcNlockmgr
			Description NFS running
			TableName _20158
		30001
			MetricClass alarm.exception
			MetricName exception.kernel_panic
			Description kernel panic
			TableName _30001
		30002
			MetricClass alarm.exception
			MetricName exception.iss_nologin
			Description iss_nologin present on the machine
			TableName _30002
		30003
			MetricClass alarm.exception
			MetricName exception.dma_disabled
			Description dma disabled on a disk
			TableName _30003
		30004
			MetricClass alarm.exception
			MetricName exception.extfs_warning
			Description ext filesystem warning
			TableName _30004
		30005
			MetricClass alarm.exception
			MetricName exception.unmounted_swap
			Description Unmounted swap partitions exist
			TableName _30005
		30006
			MetricClass alarm.exception
			MetricName exception.crashdump
			Description Crashdump found
			TableName _30006
		30007
			MetricClass alarm.exception
			MetricName exception.vm_kill
			Description Processes killed because of memory problems
			TableName _30007
		30008
			MetricClass alarm.exception
			MetricName exception.high_load
			Description Load exceeded allowed maximum
			TableName _30008
		30009
			MetricClass alarm.exception
			MetricName exception.swap_full
			Description Swap utilization exceeds limit
			TableName _30009
		30010
			MetricClass alarm.exception
			MetricName exception.tmp_full
			Description Tmp utilization exceeds limit
			TableName _30010
		30011
			MetricClass alarm.exception
			MetricName exception.var_full
			Description Var utilization exceeds limit
			TableName _30011
		30012
			MetricClass alarm.exception
			MetricName exception.root_full
			Description Root utilization exceeds limit
			TableName _30012
		30015
			MetricClass alarm.exception
			MetricName exception.nscd_wrong
			Description Nsc daemon wrong
			TableName _30015
		30017
			MetricClass alarm.exception
			MetricName exception.squid_wrong
			Description Squid daemon wrong
			TableName _30017
		30021
			MetricClass alarm.exception
			MetricName exception.crond_wrong
			Description Cron daemon wrong
			TableName _30021
		30022
			MetricClass alarm.exception
			MetricName exception.ssh_wrong
			Description Ssh daemon wrong
			TableName _30022
		30023
			MetricClass alarm.exception
			MetricName exception.syslogd_wrong
			Description Syslog daemon wrong
			TableName _30023
		30024
			MetricClass alarm.exception
			MetricName exception.atd_wrong
			Description At daemon wrong
			TableName _30024
		30025
			MetricClass alarm.exception
			MetricName exception.portmap_wrong
			Description Portmap daemon wrong
			TableName _30025
		30026
			MetricClass alarm.exception
			MetricName exception.ntpd_wrong
			Description Ntp daemon wrong
			TableName _30026
		30027
			MetricClass alarm.exception
			MetricName exception.xinetd_wrong
			Description Xinet daemon wrong
			TableName _30027
		30028
			MetricClass alarm.exception
			MetricName exception.named_wrong
			Description Name daemon wrong
			TableName _30028
		30029
			MetricClass alarm.exception
			MetricName exception.rpc_statd_wrong
			Description Rpc.stat daemon wrong
			TableName _30029
		30030
			MetricClass alarm.exception
			MetricName exception.nfsd_wrong
			Description Nfs daemon wrong
			TableName _30030
		30031
			MetricClass alarm.exception
			MetricName exception.snmpd_wrong
			Description Snmp daemon wrong
			TableName _30031
		30032
			MetricClass alarm.exception
			MetricName exception.klogd_wrong
			Description Klog daemon wrong
			TableName _30032
		30033
			MetricClass alarm.exception
			MetricName exception.sendmail_wrong
			Description Sendmail daemon wrong
			TableName _30033
		30040
			MetricClass alarm.exception
			MetricName exception.http_wrong
			Description http daemon wrong
			TableName _30040
		30042
			MetricClass alarm.exception
			MetricName exception.consoled_wrong
			Description console daemon wrong
			TableName _30042
		30045
			MetricClass alarm.exception
			MetricName exception.no_contact
			Description No Contact
			TableName _30045
		30046
			MetricClass alarm.exception
			MetricName exception.xfs_wrong
			Description Xfs daemon wrong
			TableName _30046
		30049
			MetricClass alarm.exception
			MetricName exception.zephyr_wrong
			Description zephyr daemon wrong
			TableName _30049
		30055
			MetricClass alarm.exception
			MetricName exception.tomcat
			Description tomcat wrong
			TableName _30055
		30056
			MetricClass alarm.exception
			MetricName exception.smartd_wrong
			Description SMART daemon wrong
			TableName _30056
		30057
			MetricClass alarm.exception
			MetricName exception.cupsd_wrong
			Description cups daemon wrong
			TableName _30057
		30060
			MetricClass alarm.exception
			MetricName exception.cpu_high
			Description too much CPU is being used on this server node
			TableName _30060
		30065
			MetricClass alarm.exception
			MetricName exception.var_not_writeable
			Description /var not writable
			TableName _30065
		30070
			MetricClass alarm.exception
			MetricName exception.no_login
			Description /etc/nologin present
			TableName _30070
		30073
			MetricClass alarm.exception
			MetricName exception.tmp.quota
			Description no user quota on /tmp
			TableName _30073
		30079
			MetricClass alarm.exception
			MetricName exception.nmi_received
			Description non-maskable interrupt
			TableName _30079
		30080
			MetricClass alarm.exception
			MetricName exception.shared_memory
			Description size of the shared memory wrong
			TableName _30080
		30081
			MetricClass alarm.exception
			MetricName exception.Operating_System
			Description version of OS wrong
			TableName _30081
		30087
			MetricClass alarm.exception
			MetricName exception.lpd_wrong
			Description Line Printer Daemon wrong
			TableName _30087
		30099
			MetricClass alarm.exception
			MetricName exception.unmounted_filesystems
			Description Unmounted filesystems exist
			TableName _30099
		30154
			MetricClass alarm.exception
			MetricName exception.rpcnfs
			Description nfs problem
			TableName _30154
		30155
			MetricClass alarm.exception
			MetricName exception.rpcmountd
			Description nfs problem
			TableName _30155
		30156
			MetricClass alarm.exception
			MetricName exception.rpcportmap
			Description nfs problem
			TableName _30156
		30157
			MetricClass alarm.exception
			MetricName exception.rpcrquotad
			Description nfs problem
			TableName _30157
		30158
			MetricClass alarm.exception
			MetricName exception.rpcnlockmgr
			Description nfs problem
			TableName _30158
		30247
			MetricClass alarm.exception
			MetricName exception.running_jobs
			Description no jobs in queue
			TableName _30247
		30248
			MetricClass alarm.exception
			MetricName exception.bdiistatus
			Description BDII not responding
			TableName _30248
		30250
			MetricClass alarm.exception
			MetricName exception.bdiislapd
			Description BDII slapd bad number of process
			TableName _30250
		30501
			MetricClass alarm.exception
			MetricName exception.cpu_wrong
			Description Cpu dead
			TableName _30501
		30502
			MetricClass alarm.exception
			MetricName exception.uncorrectable_error
			Description uncorrectable errors in /var/log/messages
			TableName _30502
		30503
			MetricClass alarm.exception
			MetricName exception.machine_exception
			Description Machine Check Exception reported in /var/log/messages
			TableName _30503
		30504
			MetricClass alarm.exception
			MetricName exception.io_error
			Description I/O errors reported in /var/log/messages
			TableName _30504
		30505
			MetricClass alarm.exception
			MetricName exception.filesystem_error
			Description Filesystem errors reported in /var/log/messages
			TableName _30505
		30507
			MetricClass alarm.exception
			MetricName exception.cable_unplugged
			Description Cable is unplugged message in /var/log/messages, last hour
			TableName _30507
		30901
			MetricClass alarm.exception
			MetricName exception.oramon_wrong
			Description Lemon oramon daemon wrong
			TableName _30901
		30902
			MetricClass alarm.exception
			MetricName exception.lemon_sensor_wrong
			Description Lemon sensor agents wrong
			TableName _30902
		30903
			MetricClass alarm.exception
			MetricName exception.lemon_agent_wrong
			Description Lemon agent and/or sensors misbehaving
			TableName _30903

EOF

###############################################
## a useful script that sets the environment for ora-admin
variable CONTENTS_ENV = <<EOF;
## oracle
source /etc/sysconfig/httpd

## lemon db/user/pwd
base=/etc/lemon

export MR_USERID=`cat $base/server/lemon-oramon-server.conf|grep user|sed 's/ //g'|sed 's/.*=//'`
export MR_DBNAME=`cat $base/server/lemon-oramon-server.conf|grep database_name|sed 's/ //g'|sed 's/.*=//'`
export MR_PASSWORD=`cat $base/server/lemon-oramon-server.conf|grep password|sed 's/ //g'|sed 's/.*=//'`

EOF

include { 'components/filecopy/config' };

"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/lemon-ora.admin_env.sh"),
        nlist("config",CONTENTS_ENV,
              "perms","0755"));


variable ORAMON_RELOAD_SCHEMA = <<EOF;
#!/bin/bash

source /etc/lemon/lemon-ora.admin_env.sh

lemon-ora.admin --file=/etc/oramon-server.conf --validate-cfg-file

if [ $? = 0 ]
then
  lemon-ora.admin --file=/etc/oramon-server.conf --all

  /etc/init.d/OraMon restart
  /etc/init.d/lemonmrd restart
fi

EOF

"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/reload-ora.admin"),
        nlist("config",ORAMON_RELOAD_SCHEMA,
              "owner","root",
              "perms","0755"));


"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/oramon-server.conf"),
        nlist("config",CONTENTS_ORAMON,
        	  "restart","/etc/lemon/reload-ora.admin",
              "owner","root",
              "perms","0644"));

###############################################

