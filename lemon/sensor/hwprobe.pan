#
# monitoring/lemon/sensor/hwprobe
#
# This file contains the sensor definition for the hwprobe sensor
# which covers the hwprobe output 
#
#
template monitoring/lemon/sensor/hwprobe;

# definition
"/system/monitoring/sensor/hwprobe/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Hwprobe";

# additional protocols the sensor supports
"/system/monitoring/sensor/hwprobe/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/hwprobe/module_names" = "Hwprobe";

# classes
"/system/monitoring/sensor/hwprobe/class" = list(
	nlist(
		"name", "hwprobe.memprobe",
		"descr", "status of last memory check",
		"field", list(
			nlist("name","errcode", "format", "integer"),
		)
	),
	nlist(
		"name", "hwprobe.edac",
		"descr", "status of EDAC memory controller",
		"field", list(
			nlist("name","ue", "format", "integer"),
			nlist("name","ce", "format", "integer"),
			nlist("name","pci", "format", "integer"),
			nlist("name","uenoinfo", "format", "integer"),
			nlist("name","cenoinfo", "format", "integer"),
		)
	),
	nlist(
		"name", "hwprobe.mce",
		"descr", "status of MCE machine checks",
		"field", list(
			nlist("name","hour", "format", "integer"),
			nlist("name","day", "format", "integer"),
                        nlist("name","errcode", "format", "integer"),
                        nlist("name","errtext", "format", "%128s")
		)
	),
);
