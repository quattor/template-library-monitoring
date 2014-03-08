#
# monitoring/lemon/sensor/netstat
#
# This file contains the sensor definition for the netstat sensor
#
template monitoring/lemon/sensor/netstat;

# definition
"/system/monitoring/sensor/netstat/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Netstat";

# What does the sensor not support ?
"/system/monitoring/sensor/netstat/supports" = "NoCFG NoSOD NoCHK VER";

# module names
"/system/monitoring/sensor/netstat/module_names" = "Netstat";

# classes
"/system/monitoring/sensor/netstat/class" = list(
	nlist("name", "netstat.tcpsessions",
		"descr", "reports the number of established TCP streams for a given port or program",
		"field", list(
			nlist("name", "NumberOfTcpSessions", "format", "%ld", "descr", "The number of matching TCP Streams")
		),
	)
);
