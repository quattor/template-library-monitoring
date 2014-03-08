# 
# monitoring/lemon/exception/agent
#
# This file contains the exceptions for the lemon-agent, to be used in conjunction with
# the lemon-sensor-exception

# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/exception/agent;

"/system/monitoring/exception/_30902" = nlist(
	"name",      	"lemon_sensor_wrong",
	"descr",     	"Lemon sensor agents wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"offset",	"10",
	"correlation", 	"10003:2 != 10003:3"
);

"/system/monitoring/exception/_30903"=nlist(
	"name",      	"lemon_sensors",
	"descr",     	"Lemon sensors misbehaving",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
        "offset", 	"10",
	"correlation", 	"10004:1 > 200 && (10004:7 > 10 || (10004:8 > 100000 && 4109:3 eq 'i386') || (10004:8 > 600000 && 4109:3 regex '64') || 10007:2 > 50 || 10007:3 > 10 || 10007:4 > 0)",
);


# End-of-File
