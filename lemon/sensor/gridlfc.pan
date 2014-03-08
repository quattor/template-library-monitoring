#
# monitoring/lemon/sensor/gridlfc
#
# This file contains the sensor definition for the gridlfc sensor
#
template monitoring/lemon/sensor/gridlfc;

# command line
"/system/monitoring/sensor/gridlfc/cmdline" = "/usr/bin/perl -I/opt/lcg/lib/perl -Mlfc /usr/libexec/sensors/lemon-sensor.pl GridLFC";

# additional protocols the sensor supports
"/system/monitoring/sensor/gridlfc/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/gridlfc/module_names" = "GridLFC";

# classes
"/system/monitoring/sensor/gridlfc/class"=list(
        nlist("name", "lfc.readEntry",
        	"descr", "check we can do a stat on a LFC file",
              	"field", list(
			nlist("name", "status", "format", "integer"),)
        ),

        nlist("name", "lfc.writeEntry",
              	"descr", "check we can write a new directory into a given LFC directory",
              	"field", list(
			nlist("name", "status", "format", "integer"),)
        ),

        nlist("name", "lfc.timeReaddir",
              	"descr", "return how long it takes to do a readdir on a given LFC",
              	"field", list(
			nlist("name", "time", "format", "float"),)
        ),

	nlist("name", "lfc.activeConnections",
              	"descr", "count the number of TCP connections to the LFC port in ESTABLISHED state",
              	"field", list(
			nlist("name", "count", "format", "integer"),)
        ),
);
