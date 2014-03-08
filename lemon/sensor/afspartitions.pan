#
# lemon-sensor-afspartitions
#
template monitoring/lemon/sensor/afspartitions;

"/system/monitoring/sensor/afspartitions/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFSpartitions";

"/system/monitoring/sensor/afspartitions/class" = list(
	nlist("name", "afspartitions.partitions",
		"descr", "AFS Server: Partitions Statistics",
		"field", list( 
			nlist("name", "Partitions_server",          "format", "%64s",    "unit", "Server Name",    "primary", true),
			nlist("name", "Partitions_partition",       "format", "%64s",    "unit", "Partition Name", "primary", true),
	                nlist("name", "Partitions_fillStatus",      "format", "integer", "unit", "Fill Status [%]"),
	                nlist("name", "Partitions_size",            "format", "integer", "unit", "bytes",   "scale", 1024.0),
	                nlist("name", "Partitions_used",            "format", "integer", "unit", "bytes",   "scale", 1024.0),
	                nlist("name", "Partitions_volumes",         "format", "integer", "unit", "# Volumes"),
	                nlist("name", "Partitions_online",          "format", "integer", "unit", "# Volumes Online"),
	                nlist("name", "Partitions_offline",         "format", "integer", "unit", "# Volumes Offline"),
	                nlist("name", "Partitions_committed",       "format", "integer", "unit", "bytes",   "scale", 1024.0),
	                nlist("name", "Partitions_readAccessTime",  "format", "integer", "unit", "seconds", "scale", 0.000001),
	                nlist("name", "Partitions_writeAccessTime", "format", "integer", "unit", "seconds", "scale", 0.000001),
		),	
	),
);
