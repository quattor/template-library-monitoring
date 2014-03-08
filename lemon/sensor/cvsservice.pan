#
# monitoring/lemon/sensor/cvsservice
#
# This file contains the sensor definition for the cvs remote monitoring sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/cvsservice;

# definition
"/system/monitoring/sensor/cvs/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl CVS";

# additional protocols the sensor supports
"/system/monitoring/sensor/cvs/supports" = "CFG SOD NoCHK VER";

# environment variables
"/system/monitoring/sensor/cvs/env" = nlist("CVS_RSH", "ssh");

# module names
"/system/monitoring/sensor/cvs/module_names" = "CVS";

# classes
"/system/monitoring/sensor/cvs/class" = list(

	nlist("name", "cvs.Availability",
		"descr","Availability percentage of cvsprojects in cvsservice",
		"field", list(
			nlist ("name","sshAvailability", "format", "%3.2f","unit","%"),
			nlist ("name","kserverAvailability", "format", "%3.2f","unit","%"),
			nlist ("name","pserverAvailability", "format", "%3.2f","unit","%"))
	),

	nlist("name", "cvs.Performance",
		"descr","Checkout performance of cvsprojects in cvsservice",
		"field",list(
			nlist ("name","CheckoutTime", "format", "%.3f", "unit","s"))
	)
);
