#
# monitoring/lemon/sensor/fsprobe
#
# This file contains the sensor definition for the Fsprobe sensor
#
#
template monitoring/lemon/sensor/fsprobe;

# definition
"/system/monitoring/sensor/fsprobe/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Fsprobe";

# additional protocols the sensor supports
"/system/monitoring/sensor/fsprobe/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/fsprobe/module_names" = "Fsprobe";

# classes
"/system/monitoring/sensor/fsprobe/class" = list(
	nlist(
		"name", "fsprobe.status",
		"descr", "Daemon status",
		"field", list(
			nlist("name","total", "format", "integer"),
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%64s"),
		)
	),
	nlist(
		"name", "fsprobe.statistics",
		"descr", "File system probe statistics",
		"field", list(
			nlist("name","ondisk", "format", "integer"),
			nlist("name","lasthour", "format", "integer"),
			nlist("name","info", "format", "%128s"),
		)
	)
);
