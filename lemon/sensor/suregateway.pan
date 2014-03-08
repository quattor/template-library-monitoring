#
# monitoring/lemon/sensor/suregateway
#
# This file contains the sensor definition for the suregateway sensor
#   - required for migration away from the SURE alarm system over to LAS

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/suregateway;

# definition
"/system/monitoring/sensor/suregateway/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl SureGateway --nonblocking";

# additional protocols the sensor supports
"/system/monitoring/sensor/suregateway/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/suregateway/module_names" = "SureGateway";

# classes
"/system/monitoring/sensor/suregateway/class" = list(
	nlist("name", "suregateway.listener",
		"descr", "Returns the number of connections received by the gateway over the last sampling period",
		"field", list(
			nlist("name", "Connections", "format", "%ld"),)
	),
);
