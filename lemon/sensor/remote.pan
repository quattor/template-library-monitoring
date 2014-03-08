#
# monitoring/lemon/sensor/remote
#
# This file contains the sensor definition for the remote sensor
#
template monitoring/lemon/sensor/remote;

# definition
"/system/monitoring/sensor/remote/cmdline" = "/usr/libexec/sensors/lemon-sensor-remote";

# additional protocols the sensor supports
"/system/monitoring/sensor/remote/supports" = "CFG SOD NoCHK VER";

# classes
"/system/monitoring/sensor/remote/class" = list(

	nlist("name", "remote.ping",
		"descr", "Returns ping statistics for the last ten pings sent to a given host",
		"field", list(
			nlist("name", "Sent",     "format", "%ld", "descr", "Number of packets sent"),
			nlist("name", "Received", "format", "%ld", "descr", "Number of packets received"),
			nlist("name", "Loss",     "format", "%ld", "descr", "Percentage of packets lost"),)
	),

	nlist("name", "remote.http",
		"descr", "Returns the response code and statistics of a given URL for a given service",
		"field", list(
			nlist("name", "URL",	      "format", "%1024s", "descr", "Uniform resource locater being checked"),
			nlist("name", "ConnectTime",  "format", "%.2f",   "descr", "The elapsed time needed to connect to the remote host (or proxy)", "scale", 1.0, "unit", "seconds"),
			nlist("name", "StartTime",    "format", "%.2f",   "descr", "The time taken from the start of the transfer until the first byte was received", "scale", 1.0, "unit", "seconds"),
			nlist("name", "TotalTime",    "format", "%.2f",   "descr", "The total elapsed time taken for the transfer", "scale", 1.0, "unit", "seconds"),
			nlist("name", "ResponseCode", "format", "%ld",    "descr", "The HTTP response code"),
			nlist("name", "FreeText",     "format", "%256s",  "descr", "A free text messages associated with the code"),)
	),

	nlist("name", "remote.info",
		"descr", "Returns the cluster, subcluster, state and Quattor managed status for all configured entities",
		"field", list(
			nlist("name", "EntityCluster",        "format", "%50s", "descr", "The Cluster that the entity belongs too"),
			nlist("name", "EntitySubCluster",     "format", "%50s", "descr", "The SubCluster that the entity belongs too"),
			nlist("name", "EntityState",	      "format", "%50s", "descr", "The State of the entity e.g. maintenance, production, standby ..."),
			nlist("name", "EntityQuattorManaged", "format", "%ld",  "descr", "Indicates whether the machine is managed by Quattor (1) or unmanaged (0)"),)
	),
);
