#
# monitoring/lemon/sensor/jvm
#
# This file contains the sensor definition for the jvm sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/jvm;

# definition
"/system/monitoring/sensor/jvm/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl JVM";

# additional protocols the sensor supports
"/system/monitoring/sensor/jvm/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/jvm/module_names" = "JVM";

# classes
"/system/monitoring/sensor/jvm/class" = list(

	nlist("name", "jvm.runtimeInfo",
		"descr", "Returns JVM Runtime Information",
		"field", list(
			nlist("name", "ProcessCPUTime",                 "format", "%.1f", "unit", "seconds"),
			nlist("name", "TotalCompilationTime",           "format", "%.3f", "unit", "seconds"),
			nlist("name", "LoadedClassCount",               "format", "%ld"),
			nlist("name", "UnloadedClassCount",             "format", "%ld"),
			nlist("name", "LiveThreadCount",                "format", "%ld"),
			nlist("name", "DaemonThreadCount",              "format", "%ld"),
			nlist("name", "ObjectPendingFinalizationCount", "format", "%ld"),
			nlist("name", "HeapMemoryCommitted",            "format", "%ld", "scale", 1048576.0, "unit", "bytes"),
			nlist("name", "HeapMemoryUsed",                 "format", "%ld", "scale", 1048576.0, "unit", "bytes"),
			nlist("name", "NonHeapMemoryCommitted",         "format", "%ld", "scale", 1048576.0, "unit", "bytes"),
			nlist("name", "NonHeapMemoryUsed",              "format", "%ld", "scale", 1048576.0, "unit", "bytes"),)
	),
);
