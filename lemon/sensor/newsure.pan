#
# monitoring/lemon/sensor/sure
#
# This file contains the sensor definition for the sure sensor
#   - required for migration away from the SURE alarm system over to LAS

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/newsure;

# definition
"/system/monitoring/sensor/sure/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Sure";

# additional protocols the sensor supports
"/system/monitoring/sensor/sure/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/sure/module_names" = "Sure";

# classes
"/system/monitoring/sensor/sure/class" = list(
		nlist("name", "sure.sendStatus",
		"descr", "Send the status of the node to SURE",
		"field", list(
			nlist("name", "SendStatus", "format", "%254s"),)
	),
);
