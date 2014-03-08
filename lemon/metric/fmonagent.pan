############################################################
#
# template monitoring/lemon/metric/fmonagent
#
############################################################

template monitoring/lemon/metric/fmonagent;

"/system/monitoring/metric/_4016" = nlist(
	"name",      	"MSAd",
	"descr",     	"Number of MSA processes running",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "edg-fmon-agent", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);

"/system/monitoring/metric/_10000" = nlist(
	"name",      	"MSAVersion",
	"descr",     	"MSA Monitoring Sensor Agent version",
	"class",     	"MSA.Version",
	"period",    	86400,
    	"smooth",    	nlist("typeString", true, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10002" = nlist(
	"name",		"SensorVersions",
	"descr",	"Returns the versions of the sensor/modules running under the agent",
	"class",	"MSA.SensorVersions",
	"period",	86400,
	"offset",	"5",
	"smooth",	nlist("typeString", true, "maxtime", 518400, "index", 0, "primarykeys", 2),
	"active",	true,
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
);"/system/monitoring/metric/_10004" = nlist(
	"name",      	"footprint",
	"descr",     	"CPU + Memory consumption of MSA + Sensors",
	"class",     	"MSA.Footprint",
	"period",    	600,
    	"offset",    	"5",
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10005" = nlist(
	"name",      	"HeartBeatTimeout",
	"descr",     	"Time out value for heartbeat",
	"class",     	"MSA.HeartBeatTimeout",
	"period",    	300,
    	"offset",    	"5",
    	"param",     	list("timeout", "660"), 
	"active",    	true,
	"latestonly",	true,
	"latest_expires", 86400,
        "priority", 100
);

"/system/monitoring/metric/_10006" = nlist(
	"name",      	"SensorCheck",
	"descr",     	"Check sensor responsiveness",
	"class",     	"MSA.SensorCheck",
	"period",    	900,
    	"offset",    	"5",
    	"smooth",    	nlist("typeString", true, "maxtime", 9000),
    	"param",     	list("timeout", "30"),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10007" = nlist(
	"name",      	"LogStats",
	"descr",     	"Returns log statistics for the agent and its sensors over the last sampling period",
	"class",    	"MSA.LogStats",
	"period",    	300,
    	"offset",    	"0",
    	"smooth",    	nlist("typeString", true, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_10008" = nlist(
	"name",	     	"HostnameCheck",
	"descr",     	"Consistancy check to make sure the agent identifier is the same as the machine name",
	"class",     	"MSA.HostnameCheck",
	"period",    	120,
	"offset",    	"0",
	"smooth",    	nlist("typeString", false, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_10001" = nlist(
	"name",      	"MSA.CleanLocalCache",
	"descr",     	"Remove old files from MSA local spool",
	"class",     	"MSA.CleanLocalCache",
    	"param",     	list("expiry", "7", "path", "/var/spool/edg-fmon-agent"),
	"period",    	86400,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",   	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5007" = nlist(
	"name",      	"nomorealarms.size",
	"descr",     	"size of file \"/home/operator/nomorealarms\"",
	"class",     	"file.size",
    	"param",     	list("file","/home/operator/nomorealarms"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);