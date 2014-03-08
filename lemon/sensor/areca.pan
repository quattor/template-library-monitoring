#
# monitoring/lemon/sensor/areca
#
# This file contains the sensor definition for the areca sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/areca;

# definition
"/system/monitoring/sensor/areca/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Areca";

# additional protocols the sensor supports
"/system/monitoring/sensor/areca/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/areca/module_names" = "Areca";

# classes
"/system/monitoring/sensor/areca/class" = list(
	nlist(
		"name", "areca.raidstatus",
		"descr", "Areca RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
