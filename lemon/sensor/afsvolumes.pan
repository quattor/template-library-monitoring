#
# lemon-sensor-afsvolumes
#
template monitoring/lemon/sensor/afsvolumes;

"/system/monitoring/sensor/afsvolumes/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFSvolumes";

"/system/monitoring/sensor/afsvolumes/class" = list(
        nlist("name", "afsvolumes.volumes",
		"descr", "AFS Volume Statistics",
		"field", list( 
			nlist("name", "Volumes_volumeID",           "format", "%64s",    "unit", "Volume ID", "primary", true),
	                nlist("name", "Volumes_volumeName",         "format", "%64s",    "unit", "Volume Name"),
			nlist("name", "Volumes_server",             "format", "%64s",    "unit", "Server Name",    "primary", true),
	                nlist("name", "Volumes_partition",          "format", "%64s",    "unit", "Partition Name", "primary", true),
	                nlist("name", "Volumes_type",               "format", "%64s",    "unit", "Volume Type"),
	                nlist("name", "Volumes_size",               "format", "integer", "unit", "bytes", "scale", 1024.0),
	                nlist("name", "Volumes_files",              "format", "integer", "unit", "# Files"),
	                nlist("name", "Volumes_status",             "format", "%64s",    "unit", "Volume Status"),
	                nlist("name", "Volumes_quota",              "format", "integer", "unit", "bytes", "scale", 1024.0),
	                nlist("name", "Volumes_availability",       "format", "integer", "unit", "Availability [%]"),
	                nlist("name", "Volumes_currentAccesses",    "format", "float"  , "unit", "Accesses/sec"),
	                nlist("name", "Volumes_currentReads",       "format", "float"  , "unit", "Read Accesses/sec"),
	                nlist("name", "Volumes_currentWrites",      "format", "float"  , "unit", "Write Accesses/sec"),
	                nlist("name", "Volumes_totalAccesses",      "format", "integer", "unit", "# Total Accesses"),
	                nlist("name", "Volumes_totalReads",         "format", "integer", "unit", "# Total Read Accesses"),
	                nlist("name", "Volumes_totalWrites",        "format", "integer", "unit", "# Total Write Accesses"),
	                nlist("name", "Volumes_project",            "format", "%64s",    "unit", "Project"),
	                nlist("name", "Volumes_quality",            "format", "%64s",    "unit", "Quality"),
	                nlist("name", "Volumes_depth",              "format", "integer", "unit", "Depth"),
	                nlist("name", "Volumes_flag",               "format", "integer", "unit", "Flag"),
		),	
        ),
);
