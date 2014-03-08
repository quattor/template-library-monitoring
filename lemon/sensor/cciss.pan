#
# monitoring/lemon/sensor/cciss
#
# This file contains the sensor definition for the cciss sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/cciss;

# definition
"/system/monitoring/sensor/cciss/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Cciss";

# additional protocols the sensor supports
"/system/monitoring/sensor/cciss/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/cciss/module_names" = "Cciss";

# classes
"/system/monitoring/sensor/cciss/class" = list(
	nlist(
		"name", "cciss.raidstatus",
		"descr", "Cciss RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
