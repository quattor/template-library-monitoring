#
# monitoring/lemon/exception/linux
#
# This file contains the exceptionf for the linux sensor, to be used in conjunction with
# the lemon-sensor-exception

# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
# Note: all actuators (automated recovery actions) are turned off by default
#
template monitoring/lemon/exception/wn_undernfs;


#"/system/monitoring/exception/_30051" = nlist(
#	"name",         "NFS_not_responding",
#	"descr",        "NFS not responding",
#	"active",       true,
#	"latestonly",   false,
#	"importance",   2,
##pour le moment la sonde system.exitCode ne marche pas (bug) apres changer "<" par" >"
#	"correlation",  "30050:1 < 0",
#	"actuator",     nlist("execve",  "/etc/lemon/actuator/nfsnonok.sh",
#			      "maxruns", 1,
#			      "timeout", 0,
#			      "active",  true)
#);
"/system/monitoring/exception/_30011" = nlist(
	"name",      	"var_full",
	"descr",     	"Var utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation",  "((9104:1 eq '/var') && (9104:5 > 95))",
	"actuator",     nlist("execve",  "/etc/lemon/actuator/varfull.sh",
			      "maxruns", 1,
			      "timeout", 0,
			      "active",  true)

);

"/system/monitoring/exception/_30012" = nlist(
	"name",      	"root_full",
	"descr",     	"Root utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance",	2,
	"correlation", 	"20042:1 > 90",
	"actuator",     nlist("execve",  "/etc/lemon/actuator/rootfull.sh",
			      "maxruns", 1,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30432" = nlist(
        "name",         "pbsmom_wrong",
        "descr",        "pbs_mom daemon wrong",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "correlation",  "4032:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service pbs_mom start",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);


# End-of-File
