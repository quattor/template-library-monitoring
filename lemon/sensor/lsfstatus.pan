#
# monitoring/lemon/sensor/lsfstatus
#
# This file contains the sensor definition for the lsf state sensor
#
template monitoring/lemon/sensor/lsfstatus;

# command line
"/system/monitoring/sensor/lsfstatus/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl LsfStatus";

# additional protocols the sensor supports
"/system/monitoring/sensor/lsfstatus/supports" = "CFG SOD VER";

# environment variables
"/system/monitoring/sensor/lsfstatus/env" = nlist(
		"ORACLE_HOME", "/afs/cern.ch/project/oracle/@sys/prod",
		"TNS_ADMIN",   "/afs/cern.ch/project/oracle/admin/");

# module names
"/system/monitoring/sensor/lsfstatus/module_names" = "LsfStatus";

# classes
"/system/monitoring/sensor/lsfstatus/class" = list (
	nlist(
		"name",  "lsfstatus.queues",
		"descr", "Status of LSF queues",
		"field", list(
			nlist("name", "runningjobs",   "format", "%ld"),
			nlist("name", "pendingjobs",   "format", "%ld"),
			nlist("name", "suspendedjobs", "format", "%ld")
		)
	),
	nlist(
		"name",  "lsfstatus.hosts",
		"descr", "LSF worker node status",
		"field", list(
			nlist("name", "OK",  	      "format", "%ld"),
			nlist("name", "closed_FULL",  "format", "%ld"),
			nlist("name", "closed_BUSY",  "format", "%ld"),
			nlist("name", "closed_ADM",   "format", "%ld"),
			nlist("name", "closed_LIM",   "format", "%ld"),
			nlist("name", "unreachable",  "format", "%ld"),
			nlist("name", "unavailable",  "format", "%ld"),
			nlist("name", "total_kSI2K",  "format", "float"),
			nlist("name", "ok_kSI2K",     "format", "float"),
			nlist("name", "busy_kSI2K",   "format", "float"),
			nlist("name", "dead_kSI2K",   "format", "float"),
			nlist("name", "averload",     "format", "float")
		)
	),
	nlist(
		"name",  "lsfstatus.acct",
		"descr", "LSF accounting information",
		"field", list(
			nlist("name", "wallksi2k24h",       "format", "float"),
			nlist("name", "cpuksi2k24h",        "format", "float"),
			nlist("name", "maxRMem",            "format", "float"),
			nlist("name", "maxRSwap",           "format", "float"),
			nlist("name", "maxRMemError",       "format", "float"),
			nlist("name", "maxRSwapError",      "format", "float"),
			nlist("name", "userRtime",          "format", "float"),
			nlist("name", "userStime",          "format", "float"),
			nlist("name", "userRtimeError",     "format", "float"),
			nlist("name", "userStimeError",     "format", "float"),
                        nlist("name", "avRPending",         "format", "float"),
                        nlist("name", "avRRunning",         "format", "float"),
                        nlist("name", "avRPendingError",    "format", "float"),
                        nlist("name", "avRRunningError",    "format", "float"),
                        nlist("name", "avNPending",         "format", "float"),
                        nlist("name", "avNRunning",         "format", "float"),
                        nlist("name", "avNPendingError",    "format", "float"),
                        nlist("name", "avNRunningError",    "format", "float"),
			nlist("name", "numDone",            "format", "%ld"),
			nlist("name", "numExit",            "format", "%ld"),
			nlist("name", "numKill",            "format", "%ld"),
			nlist("name", "numKillPend",        "format", "%ld"),
			nlist("name", "numCPULim",          "format", "%ld"),
			nlist("name", "numRUNLim",          "format", "%ld"),
			nlist("name", "avjobthrouput",      "format", "float"),
			nlist("name", "avcpuutil",          "format", "float"),
			nlist("name", "avcpuutilError",     "format", "float"),
	                nlist("name", "cpubywall",	    "format", "float")
		)
	),

        nlist(
		"name",  "lsfstatus.acct_users",
		"descr", "Per-user LSF accounting information",
		"field", list(
                        nlist("name","username",       	"format", "%20s", "primary", true),
                        nlist("name","lsf_instance",   	"format", "%20s", "primary", true),
                        nlist("name","groupname",      	"format", "%20s"),
                        nlist("name","wallksi2k24h",   	"format", "float"),
                        nlist("name","cpuksi2k24h",    	"format", "float"),
                        nlist("name","maxRMem",        	"format", "float"),
                        nlist("name","maxRSwap",       	"format", "float"),
                        nlist("name","maxRMemError",   	"format", "float"),
                        nlist("name","maxRSwapError",  	"format", "float"),
                        nlist("name","userRtime",      	"format", "float"),
                        nlist("name","userStime",      	"format", "float"),
                        nlist("name","userRtimeError", 	"format", "float"),
                        nlist("name","userStimeError", 	"format", "float"),
                        nlist("name","avRPending",     	"format", "float"),
                        nlist("name","avRRunning",     	"format", "float"),
                        nlist("name","avRPendingError", "format", "float"),
                        nlist("name","avRRunningError", "format", "float"),
                        nlist("name","avNPending",     	"format", "float"),
                        nlist("name","avNRunning",     	"format", "float"),
                        nlist("name","avNPendingError", "format", "float"),
                        nlist("name","avNRunningError", "format", "float"),
                        nlist("name","numDone",        	"format", "%ld"),
                        nlist("name","numExit",        	"format", "%ld"),
                        nlist("name","numKill",        	"format", "%ld"),
                        nlist("name","numKillPend",    	"format", "%ld"),
                        nlist("name","numCPULim",      	"format", "%ld"),
                        nlist("name","numRUNLim",      	"format", "%ld"),
                        nlist("name","avjobthrouput",  	"format", "float"),
                        nlist("name","avcpuutil",      	"format", "float"),
                        nlist("name","avcpuutilError", 	"format", "float"),
                        nlist("name","cpubywall",	"format", "float")
		)
        ),
); 

