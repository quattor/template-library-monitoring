# 
# monitoring/lemon/exception/parselog
#
# This file contains the parse log sensor exceptionsto be used in conjunction with
# the lemon-sensor-exception

# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
# Note: all actuators (automated recovery actions) are turned off by default
#
template monitoring/lemon/exception/parselog;

"/system/monitoring/exception/_30001" = nlist(
	"name",      	"kernel_panic",
	"descr",     	"kernel panic",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation", 	"5121:1 != 0"
);

"/system/monitoring/exception/_30007" = nlist(
	"name",      	"vm_kill",
	"descr",     	"Processes killed because of memory problems",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation", 	"5122:1 != 0"
);

"/system/monitoring/exception/_30502" = nlist(
	"name",      	"uncorrectable_error",
	"descr",     	"uncorrectable errors in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"5125:1 != 0"
);

"/system/monitoring/exception/_30503" = nlist(
	"name",      	"machine_exception",
	"descr",     	"Machine Check Exception reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"5127:1 != 0"
);

"/system/monitoring/exception/_30504" = nlist(
	"name",      	"io_error",
	"descr",     	"I/O errors reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance",	2,
	"correlation", 	"5130:1 != 0"
);

"/system/monitoring/exception/_30505" = nlist(
	"name",      	"filesystem_error",
	"descr",     	"Filesystem errors reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation",  "5131:1 != 0"
);


# End-of-File
