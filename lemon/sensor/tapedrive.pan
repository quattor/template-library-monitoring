#
# monitoring/lemon/sensor/tapedrive
#
# This file contains the sensor definition for the tapedrive sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/tapedrive;

# definition
"/system/monitoring/sensor/tapedrive/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl TapeDrive";

# additional protocols the sensor supports
"/system/monitoring/sensor/tapedrive/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/tapedrive/module_names" = "TapeDrive";

# classes
"/system/monitoring/sensor/tapedrive/class" = list(
	nlist(
		"name", "tapedrive.LEOT",
		"descr", "tapedrive LEOT bit status",
		"field", list(
			nlist("name","status", "format", "integer"),
		)
	),	
    nlist(
		"name", "tapedrive.NVC",
		"descr", "tapedrive NVC bit status",
		"field", list(
			nlist("name","status", "format", "integer"),
		)
	)

);
