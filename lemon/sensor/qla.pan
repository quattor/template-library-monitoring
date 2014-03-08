#
# monitoring/lemon/sensor/qla
#
# This file contains the sensor definition for the Qlogic sensor
#
#
template monitoring/lemon/sensor/qla;

# definition
"/system/monitoring/sensor/qla/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Qla";

# additional protocols the sensor supports
"/system/monitoring/sensor/qla/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/qla/module_names" = "Qla";

# classes
"/system/monitoring/sensor/qla/class" = list(
	nlist(
		"name", "qla.portstatus",
		"descr", "Qlogic port status",
		"field", list(
			nlist("name","adapter", "format", "integer"),
			nlist("name","interrupts", "format", "float"),
			nlist("name","errcode", "format", "integer"),
			nlist("name","errtext", "format", "%128s"),
		)
	)
);
