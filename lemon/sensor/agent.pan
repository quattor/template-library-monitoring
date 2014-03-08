#
# The file contains the sensor definition for the builtin sensor of the lemon-agent

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.13.1-1
#
template monitoring/lemon/sensor/agent;

# command line
"/system/monitoring/sensor/MSA/cmdline" = "";  # builtin

# class definitions
"/system/monitoring/sensor/MSA/class" = list( 
	nlist("name", "MSA.Version",
		"descr", "MSA Monitoring Sensor Agent version",
		"field", list(
			nlist ("name", "MSA.Version", "format", "%20s"),
		)
	),

	nlist("name", "MSA.Footprint",
		"descr", "CPU + Memory consumption of MSA + Sensors",
		"field", list(
			nlist("name", "AgentUptime",                "format", "%ld" , "descr", "agent uptime (1/100th second)"),
                       	nlist("name", "TotalCpuUsed",               "format", "%ld",  "descr", "total cpu used (1/100th second)"),
                       	nlist("name", "AgentCPUOverLastInterval",   "format", "%.2f", "descr", "agent resources used : cpu over last interval"),
                       	nlist("name", "AgentVsize",                 "format", "%ld",  "descr", "agent resources used : vsize (kB)"),
                       	nlist("name", "AgentRss",                   "format", "%ld",  "descr", "agent resources used : rss (kB)"),
                       	nlist("name", "AgentMemUsed",               "format", "%.2f", "descr", "agent resources used : %mem used"),
                       	nlist("name", "SensorsCPUOverLastInterval", "format", "%.2f", "descr", "sensors resources used (total): cpu over last interval"),
                       	nlist("name", "SensorsVsize",               "format", "%ld",  "descr", "sensors resources used (total): vsize (kB)"),
                       	nlist("name", "SensorsRss",                 "format", "%ld",  "descr", "sensors resources used (total): rss (kB)"),
                       	nlist("name", "SensorsMemUsed",             "format", "%.2f", "descr", "sensors resources used (total): %mem used"),
		)
	),

	nlist("name", "MSA.HeartBeatTimeout",
		"descr", "Time out value for heartbeat",
		"field", list(
			nlist("name", "MSA.HeartBeatTimeout", "format", "integer"),
		)
	),

	nlist("name", "MSA.SensorCheck",
		"descr", "Check sensor responsiveness",
		"field", list(
			nlist("name", "MSA.SensorCheck", "format", "%32s"),
		)
	),

	nlist("name", "MSA.CleanLocalCache",
		"descr", "Remove old files from MSA local spool",
		"field", list(
			nlist("name", "MSA.CleanLocalCache", "format", "integer"),
		)
	),

	nlist("name", "MSA.LogStats",
		"descr", "Returns log statistics for the agent and its sensors over the last sampling period",
		"field", list(
			nlist("name", "Info",  "format", "%ld", "unit", "count", "scale", 1.0, "descr", "number of info messages"),
			nlist("name", "Warn",  "format", "%ld", "unit", "count", "scale", 1.0, "descr", "number of warning messages"),
			nlist("name", "Error", "format", "%ld", "unit", "count", "scale", 1.0, "descr", "number of error messages"),
			nlist("name", "Fatal", "format", "%ld", "unit", "count", "scale", 1.0, "descr", "number of fatal messages. Note: fatal messages are only recorded for sensors as messages of this type for the agent would cause a shutdown"),
		)
	),
	
	nlist("name", "MSA.Alive",
		"descr", "The first number return is always \"1\" (can be used as a heart beat). Then follows the number of running sensors out of the number that should be running (x y).",
		"field", list(
			nlist("name", "HeartBeat"     , "format", "%ld", "descr", "the number \"1\""),
                       	nlist("name", "RunningSensors", "format", "%ld", "descr", "actual number of running sensors",  "scale", 1.0, "unit", "count"),
		       	nlist("name", "TotalSensors"  , "format", "%ld", "descr", "desired number of running sensors", "scale", 1.0, "unit", "count"),
		)
	),

	nlist("name", "MSA.HostnameCheck",
		"descr", "Consistancy check to make sure the agent identifier is the same as the machine name",
		"field",list(
			nlist("name", "HostnameCheck", "format", "%ld"),
		)
	),
);


# End-of-File
