#
# monitoring/lemon/sensor/adaptec
#
# This file contains the sensor definition for the adaptec RAID array
#
template monitoring/lemon/sensor/adaptec;

# definition
"/system/monitoring/sensor/adaptec/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Adaptec";

# additional protocols the sensor supports
"/system/monitoring/sensor/adaptec/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/adaptec/module_names" = "Adaptec";

# classes
"/system/monitoring/sensor/adaptec/class" = list(
	nlist(
		"name", "adaptec.raidstatus",
		"descr", "Adaptec RAID Status",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s")
		)
	)
);
