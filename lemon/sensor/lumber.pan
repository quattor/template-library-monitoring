#
# monitoring/lemon/sensor/lumber
#
# Contact: Gang.Qin@cern.ch
#
template monitoring/lemon/sensor/lumber;

# definition
"/system/monitoring/sensor/lumber/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Lumber";

# additional protocols the sensor supports
"/system/monitoring/sensor/lumber/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/lumber/module_names" = "Lumber";

# classes
"/system/monitoring/sensor/lumber/class" = list(
        nlist("name", "lumber.process", "descr", "Checks to see if the dq2agents and dq2udpserver are running",
              "field", list(
		nlist ("name", "fileName", "format", "%1024s"),
		nlist ("name", "mailBeSent", "format", "%ld", "scale", 1.0, "unit", "bool"),
		nlist ("name", "mailBeSentTime", "format", "%ld", "scale", 1.0, "unit", "seconds"),
		nlist ("name", "restartDone", "format", "%ld", "scale", 1.0, "unit", "bool"),
		nlist ("name", "restartDoneTime", "format", "%ld", "scale", 1.0, "unit", "seconds"),)
        ),
);
