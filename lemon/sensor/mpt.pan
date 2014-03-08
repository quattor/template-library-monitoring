#
# monitoring/lemon/sensor/mpt
#
# This file contains the sensor definition for the mpt sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/mpt;

# definition
"/system/monitoring/sensor/mpt/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Mpt";

# additional protocols the sensor supports
"/system/monitoring/sensor/mpt/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/mpt/module_names" = "Mpt";

# classes
"/system/monitoring/sensor/mpt/class" = list(
	nlist(
		"name", "mpt.raidstatus",
		"descr", "Mpt RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
