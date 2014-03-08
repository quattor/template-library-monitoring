#
# monitoring/lemon/sensor/hwscan
#
# This file contains the sensor definition for the hwscan sensor to check 
# that the hardware defined in cdb is the same as reported by lemon

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/hwscan;

# definition
"/system/monitoring/sensor/hwscan/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Hwscan";

# additional protocols the sensor supports
"/system/monitoring/sensor/hwscan/supports" = "CFG SOD NoCHK VER";

# module names
"/system/monitoring/sensor/hwscan/module_names" = "Hwscan";

# classes
"/system/monitoring/sensor/hwscan/class" = list(
	nlist(
		"name", "hwscan.check",
		"descr", "Compare CDB and hardware",
		"field", list(
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%1024s")
		)
	),
	nlist(
		"name", "hwscan.DiskDrives",
		"descr", "Get number of drives and available space",
		"field", list(
			nlist("name","driveCount", "format", "%ld"),
			nlist("name","driveSpace", "format", "%.1f")
		)
	)
);
