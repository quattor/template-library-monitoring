#
# monitoring/lemon/exception/file
#
# This file contains the exceptions for the file sensor, to be used in conjunction with
# the lemon-sensor-exception

# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/exception/file;

"/system/monitoring/exception/_30006" = nlist(
	"name",      	"crashdump",
	"descr",     	"Crashdump found",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
	"correlation",  "20044:1 > -1"
);

"/system/monitoring/exception/_30010" = nlist(
	"name",      	"tmp_full",
	"descr",     	"Tmp utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"20012:1 > 90",
	"actuator", 	nlist("execve",  "/usr/local/sbin/clean-tmp-partition -o 75",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);


# End-of-File
