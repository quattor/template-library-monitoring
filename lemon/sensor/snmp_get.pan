#
# This file contains the sensor definition for the snmp-get sensor

# Dependencies
# - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/snmp_get;

# definition
"/system/monitoring/sensor/snmpget/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl SNMPGet";

# additional protocols the sensor supports
"/system/monitoring/sensor/snmpget/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/snmpget/module_names" = "SNMPGet";

# classes
"/system/monitoring/sensor/snmpget/class" = list(
	nlist(
		"name", "snmpget.getint",
		"descr", "the return value of a snmp get query",
		"field", list(
			nlist("name","status", "format", "integer"),
		)
	),

);

# exception: raise alarm if anything is unreachable via snmp
#
"/system/monitoring/exception/_30525"=nlist(
	"name", "SNMPGet_Heartbeat_Wrong",
	"descr", "SNMPGet heartbeat not received",
	"active", true,
	"latestonly",false,
	"importance", 1,
	"alarmtext", "SNMPGet_Heartbeat_Wrong",
	"correlation", "*:6335:1 == -1",
	"minoccurs", 2,
);
