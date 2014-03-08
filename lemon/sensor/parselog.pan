#
# monitoring/lemon/sensor/parselog
#
# This file contains the sensor definition for the parselog sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.13.1-1
#    - Requires: lemon-sensor-parse-log     >= 1.0.1-1
#
template monitoring/lemon/sensor/parselog;

# command line
"/system/monitoring/sensor/parselog/cmdline"="/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl ParseLog";

# definition for a *virtual* group sensor.
#
"/system/monitoring/sensor/parselog/group_name"   = "WN";
"/system/monitoring/sensor/parselog/module_names" = "ParseLog";

# class definitions
"/system/monitoring/sensor/parselog/class"=list(
	nlist("name", "log.Parse", "descr", "returns a count of the number of lines matching the specified user criteria within a log file",
	      	"field", list(
			nlist("name", "count", "format", "%ld", "scale", 1.0, "unit", "count", "descr", "Number of matching log entries"),
		)
	),
);


# End-of-File
