#
# monitoring/lemon/sensor/md
#
# This file contains the sensor definition for the software RAID sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/md;

# definition
"/system/monitoring/sensor/md/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Md";

# additional protocols the sensor supports
"/system/monitoring/sensor/md/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/md/module_names" = "Md";

# classes
"/system/monitoring/sensor/md/class" = list(
	nlist(
		"name", "md.raidstatus",
		"descr", "Software RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
