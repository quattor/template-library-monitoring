#
# monitoring/metric/jvm
#
# This file contains the default metrics for JVM monitoring
#
template monitoring/lemon/metric/jvm;

"/system/monitoring/metric/_9033" = nlist(
	"name",       	"JVMRunTimeInfo",
	"descr",      	"Returns information on the Java Virtual Machine runtime statistics",
	"class",      	"jvm.runtimeInfo",
	"param",	list("statfile", "/var/run/sensor-jvm/stat.xml"), 
	"period",     	300,
    	"offset",     	"0",
	"active",     	true,
	"latestonly", 	false,
);
