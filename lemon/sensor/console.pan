#
# monitoring/lemon/sensor/console
#
# This file contains the sensor definition for the console sensor
#
template monitoring/lemon/sensor/console;

# command line 
"/system/monitoring/sensor/console/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Console";

# additional protocols the sensor supports
"/system/monitoring/sensor/console/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/console/module_names" = "Console";

# classes
"/system/monitoring/sensor/console/class" = list(

	nlist("name", "console.ConsoleAccess",
		"descr", "Console service status",
		"field", list(
			nlist("name", "errtext", "format", "%256s")
		)
	),
);
