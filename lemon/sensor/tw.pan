#
# monitoring/lemon/sensor/tw
#
# This file contains the sensor definition for the tw sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/tw;

# definition
"/system/monitoring/sensor/tw/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Tw";

# additional protocols the sensor supports
"/system/monitoring/sensor/tw/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/tw/module_names" = "Tw";

# classes
"/system/monitoring/sensor/tw/class" = list(
	nlist(
		"name", "tw.raidstatus",
		"descr", "3ware RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
