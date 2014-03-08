#
# This file contains the sensor definition for the linux sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#
template monitoring/lemon/sensor/exception;

# command line
"/system/monitoring/sensor/exception/cmdline" = "/usr/libexec/sensors/lemon-sensor-exception";

# sensor options
"/system/monitoring/sensor/exception/supports" = "CFG CHK SOD VER";

# backwards compatibility for lemon-sensor-exception < 1.0.2-1
#"/system/monitoring/sensor/exception/env" = nlist(
#       "MR_SHORTHOSTNAME",	"1",
#       "MR_SPOOLDIR",		"/var/spool/edg-fmon-agent",
#       "MSA_SAMPLEONDEMAND",	"/var/run/edg-fmon-agent"
#);
#
# class definitions
"/system/monitoring/sensor/exception/class" = list(
	nlist("name", "alarm.exception",
		"descr", "exception monitoring class",
		"field", list(
			nlist("name", "exceptstate", "format","%ld"),
			nlist("name", "code",    "format","%3s"),
			nlist("name", "freetxt", "format","%1024s"),
		)
	),
);

# End-of=-File
