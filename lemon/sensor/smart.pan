#
# monitoring/lemon/sensor/smart
#
# This file contains the sensor definition for the smart sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/smart;

# definition
"/system/monitoring/sensor/smart/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Smart";

# additional protocols the sensor supports
"/system/monitoring/sensor/smart/supports" = "CFG SOD NoCHK VER";

# module names
"/system/monitoring/sensor/smart/module_names" = "Smart";

# classes
"/system/monitoring/sensor/smart/class" = list(
	nlist(
		"name", "smart.failing",
		"descr", "Smart Counter Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	),
	nlist(
		"name", "smart.temperature",
		"descr", "Smart Disk Temperature",
		"field", list(
			nlist("name","average", "format", "float"),
			nlist("name","rms", "format", "float")
		)
	),
	nlist(
		"name", "smart.SELFtest",
		"descr", "Smart Self test status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
