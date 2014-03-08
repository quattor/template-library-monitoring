#
# monitoring/lemon/sensor/dip
#
# This file contains the sensor definition for the DIP (Data Interchange Protocol) sensor
# The classes defined here are fake! Don't forget to redefine the class names on the node 
# running the sensor
#
template monitoring/lemon/sensor/dip;

# definition
"/system/monitoring/sensor/dip/cmdline" = "/usr/libexec/sensors/lemon-sensor-dip";

# environment variables
"/system/monitoring/sensor/dip/env" = nlist(
	"LD_LIBRARY_PATH", "/usr/libexec/sensors/lib/DIP/",
	"DIM_DNS_NODE", "fwserv01.cern.ch",
	"DIM_DNS_PORT", "2506");

# classes
"/system/monitoring/sensor/dip/class" = list(

	nlist("name", "dip.ups",
		"descr", "Power consumption of the CERN Computer Centre critical UPS systems",
		"field", list(
			nlist("name", "Phase01", "format", "%.2f", "scale", 1000.0, "unit", "kW"),
			nlist("name", "Phase02", "format", "%.2f", "scale", 1000.0, "unit", "kW"),
			nlist("name", "Phase03", "format", "%.2f", "scale", 1000.0, "unit", "kW"),
			nlist("name", "Total",   "format", "%.2f", "scale", 1000.0, "unit", "kW"),)
	),

	nlist("name", "dip.temperature",
		"descr", "Temperature readings from the CERN Computer Centre",
		"field", list(
			nlist("name", "Temperature", "format", "%.1f", "scale", 1.0, "unit", "C"),
		)
	),

	#
	# This is the real class exposed by this sensor
	#
	nlist("name", "dip.subscribe",
		"descr", "If you are seeing this description CDB has been configured incorrectly!!",
		"field", list(
			nlist("name", "dummy", "format", "%ld"),)
	),		
);
