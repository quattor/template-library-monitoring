#
# monitoring/lemon/sensor/plcQuery
#
# This file contains the sensor definition for the plcQuery sensor
#
template monitoring/lemon/sensor/plcQuery;

# command line
"/system/monitoring/sensor/plcQuery/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl PlcQuery";

# additional protocols the sensor supports
"/system/monitoring/sensor/plcQuery/supports" = "CFG SOD NoCHK VER";

# module names
"/system/monitoring/sensor/plcQuery/module_names" = "PlcQuery";

# classes
"/system/monitoring/sensor/plcQuery/class" = list(

    	nlist("name", "plc.PDU",
        	"descr", "pdu power consumption data",
	      	"field", list(
			nlist("name", "kW",   "format", "%.1f"),
                       	nlist("name", "kVA",  "format", "%.1f"),
                       	nlist("name", "An",   "format", "%.1f"),
                       	nlist("name", "A1",   "format", "%.1f"),
                       	nlist("name", "kW1",  "format", "%.1f"),
                       	nlist("name", "kVA1", "format", "%.1f"),
                       	nlist("name", "A2",   "format", "%.1f"),
                       	nlist("name", "kW2",  "format", "%.1f"),
                       	nlist("name", "kVA2", "format", "%.1f"),
                       	nlist("name", "A3",   "format", "%.1f"),
                       	nlist("name", "kW3",  "format", "%.1f"),
                       	nlist("name", "kVA3", "format", "%.1f"),)
        ),

	nlist("name", "plc.Summary",
          	"descr", "power consumption per defined location",
	      	"field", list(
			nlist("name", "totalActivePower",   "format", "%.1f"),
                   	nlist("name", "totalApparentPower", "format", "%.1f"),
			nlist("name", "limit",              "format", "%.1f"),)
        ),
); 





