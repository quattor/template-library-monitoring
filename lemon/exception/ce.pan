# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
# Note: all actuators (automated recovery actions) are turned off by default
#
template monitoring/lemon/exception/ce;

"/system/monitoring/exception/_30011" = nlist(
	"name",      	"var_full",
	"descr",     	"Var utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"minoccurs",	3,
	"correlation",  "((9104:1 eq '/var') && (9104:5 > 95))",
	"actuator",     nlist("execve",  "/etc/lemon/actuator/varfull.sh",
			      "maxruns", 1,
			      "timeout", 60,
			      "active",  true)

);

"/system/monitoring/exception/_30012" = nlist(
	"name",      	"root_full",
	"descr",     	"Root utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance",	3,
	"minoccurs",	3,
	"correlation", 	"((9104:1 eq '/') && (9104:5 > 95))",
	"actuator",     nlist("execve",  "/etc/lemon/actuator/rootfull.sh",
			      "maxruns", 1,
			      "timeout", 60,
			      "active",  true)
);
#"/system/monitoring/exception/_30013" = nlist(
#        "name",         "home_full",
#        "descr",        "Home utilization exceeds limit",
#        "active",       true,
#        "latestonly",   false,
#        "importance",   2,
#        "correlation",  "((9104:1 eq '/home') && (9104:5 > 95))",
#	"actuator",     nlist("execve",  "/etc/lemon/actuator/homefull.sh",
#			      "maxruns", 1,
#			      "timeout", 60,
#			      "active",  true)
#
#);

"/system/monitoring/exception/_30433" = nlist(
        "name",         "pbs_server_wrong",
        "descr",        "pbs_server daemon wrong",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "correlation",  "4033:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service pbs_server start",
                              "maxruns", 3,
                              "timeout", 60,
                              "active",  true)
);








# End-of-File
