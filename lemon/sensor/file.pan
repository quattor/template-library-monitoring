#
# monitoring/lemon/sensor/file
#
# This file contains the sensor definition for the file sensor distribution with the
# agent base installation

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/sensor/file;

# command line
"/system/monitoring/sensor/file/cmdline" = "/usr/libexec/sensors/edg-fmon-sensor-file";

# definition for a *virtual* group sensor.
#
#"/system/monitoring/sensor/file/group_name"   = "WN";
#"/system/monitoring/sensor/file/module_name" = "file";

# class definitions
"/system/monitoring/sensor/file/class" = list(
	nlist("name", "file.size", 
		"descr", "size of the file in kilobytes",
		"field", list(
			nlist("name", "FileSize", "format", "%ld", "scale", 1.0, "unit", "bytes"),
		)
	),

	nlist("name", "file.md5sum", 
		"descr", "md5 checksum of the file",
		"field", list(
			nlist("name", "FileMD5Sum", "format", "%32s"),
		)
	),

	nlist("name", "file.filesystemUse", 
		"descr", "usage of the file system as a percentage of the total size",
		"field", list(
			nlist("name", "FileSystemUse", "format", "%.1f"),
		)
	),

	nlist("name", "file.spaceUsed", 
		"descr", "returns the space used of a given directory and its sub-directories in bytes",
		"field", list(
			nlist("name", "UsedSpace", "format", "%.2f", "unit", "bytes"),
		)
	),

	nlist("name", "file.dump", 
		"descr", "dumps given file content (line by line) when initialized and further data written to it",
		"field", list(
			nlist("name", "FileData", "format", "%2000s"),
		)
	),

	nlist("name", "file.filecount",
		"descr", "returns the number of files within a given directory based on the criteria specified at initialisation",
		"field", list(
			nlist("name", "FileCount", "format", "%ld"),
		)
	),

	nlist("name", "file.sslmtime",
		"descr", "returns the number of seconds since the file was last modified or -1 if the file does not exist.",
		"field", list(
			nlist("name", "Seconds", "format", "%ld"),
		)
	),		
);


# End-of-File
