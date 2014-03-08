# 
# monitoring/lemon/metric/agent
#
# This file contains the default metrics for the lemon-agent

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/agent;

"/system/monitoring/metric/_10000" = nlist(
	"name",      	"MSAVersion",
	"descr",     	"MSA Monitoring Sensor Agent version",
	"class",     	"MSA.Version",
	"period",    	86400,
	"active",    	true,
	"latestonly",	true,
);

"/system/monitoring/metric/_10001" = nlist(
	"name",      	"MSA.CleanLocalCache",
	"descr",     	"Remove old files from MSA local spool",
	"class",     	"MSA.CleanLocalCache",
    	"param",     	list("expiry", "7", "path", "/var/spool/edg-fmon-agent"),
	"period",   	86400,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10003/" = nlist(
	"name",	     	"alive",
	"descr",     	"The first number return is always \"1\" (can be used as a heart beat). Then follows the number of running sensors out of the number that should be running (x y)",
	"class",     	"MSA.Alive",
	"period",    	600,
	"offset",    	"5",
	"active",    	true,
	"latestonly",	true,
);

"/system/monitoring/metric/_10004" = nlist(
	"name",      	"footprint",
	"descr",     	"CPU + Memory consumption of MSA + Sensors",
	"class",     	"MSA.Footprint",
	"period",    	300,
    	"offset",    	"5",
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10005" = nlist(
	"name",      	"HeartBeatTimeout",
	"descr",     	"Time out value for heartbeat",
	"class",     	"MSA.HeartBeatTimeout",
    	"param",     	list("timeout", "660"), 
	"period",    	300,
    	"offset",    	"5",
	"active",    	true,
	"latestonly",	true,
);

"/system/monitoring/metric/_10006" = nlist(
	"name",      	"SensorCheck",
	"descr",     	"Check sensor responsiveness",
	"class",     	"MSA.SensorCheck",
   	"param",     	list("timeout", "30"),
	"period",    	900,
    	"offset",    	"5",
    	"smooth",    	nlist("typeString", true, "maxtime", 9000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10007" = nlist(
	"name",      	"LogStats",
	"descr",     	"Returns log statistics for the agent and its sensors over the last sampling period",
	"class",     	"MSA.LogStats",
	"period",    	300,
    	"offset",    	"0",
    	"smooth",    	nlist("typeString", true, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10008" = nlist(
	"name",	     	"HostnameCheck",
	"descr",     	"Consistancy check to make sure the agent identifier is the same as the machine name",
	"class",     	"MSA.HostnameCheck",
	"period",    	120,
	"offset",    	"0",
	"smooth",    	nlist("typeString", false, "maxtime", 86400),
	"active",    	true,
	"latestonly",	true,
);


# End-of-File
