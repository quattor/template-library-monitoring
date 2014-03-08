#
# monitoring/lemon/sensor/ipmi
#
# This file contains the sensor definition for the tapedrive sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1, ipmitool >= 1.8.8
#
template monitoring/lemon/sensor/ipmi;

# definition
"/system/monitoring/sensor/ipmi/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl IPMI";

# additional protocols the sensor supports
"/system/monitoring/sensor/ipmi/supports" = "CFG CHK VER";

# module names
"/system/monitoring/sensor/ipmi/module_names" = "IPMI";

# classes
"/system/monitoring/sensor/ipmi/class" = list(
	nlist(
		"name", "IPMI.cpu",
		"descr", "Average and Standard Deviation of the CPU temperature",
		"field", list(
			nlist("name","average", "format", "float"),
			nlist("name","stdeviation", "format", "float"),
		)
	),	
	nlist(
		"name", "IPMI.fan",
		"descr", "Average and Standard Deviation of the fans speed rotation",
		"field", list(
			nlist("name","average", "format", "float"),
			nlist("name","stdeviation", "format", "float"),
		)
	),	
	nlist(
		"name", "IPMI.voltage",
		"descr", "Reading of a voltage ",
		"field", list(
			nlist("name","voltage", "format", "float"),
		)
	),
	nlist(
		"name", "IPMI.sel",
		"descr", "IPMI SEL log information",
		"field", list(
                        nlist("name","entries", "format", "integer"),
                        nlist("name","percent", "format", "integer"),
                        nlist("name","errcode", "format", "integer"),
                        nlist("name","errtext", "format", "%128s")
		)
	),	
	nlist(
		"name", "IPMI.avgrmscnt",
		"descr", "Average, Standard Deviation and count of IPMI data",
		"field", list(
			nlist("name","average", "format", "float"),
			nlist("name","stdeviation", "format", "float"),
			nlist("name","count", "format", "integer"),
		)
	),	
	nlist(
		"name", "IPMI.avgdelta",
		"descr", "Average and change (hourly rate) since last IPMI data",
		"field", list(
			nlist("name","average", "format", "float"),
			nlist("name","change", "format", "float"),
		)
	),
	nlist(
		"name", "IPMI.ping",
		"descr", "Remote connection to BMC",
		"field", list(
			nlist("name","packetloss", "format", "integer"),
		)
	),
);
