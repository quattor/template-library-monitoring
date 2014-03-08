############################################################
#
# template monitoring/lemon/metric/smart
#
# Monitor the disk smart statistics
#
############################################################

template monitoring/lemon/metric/smart;

"/system/monitoring/metric/_6130" = nlist(
	"name",      	"ChkSmartFailing",
	"descr",     	"Check if any smart counters are failing",
	"class",     	"smart.failing",
	"period",    	86400,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 9600),
	"active",    	false,
	"latestonly",	false,
);

#
# Error codes below 20 are not fatal but are logged for warning
# and history tracking
"/system/monitoring/metric/_6131" = nlist(
	"name",      	"SmartTemperature",
	"descr",     	"Measure the temperature of the disks",
	"class",     	"smart.temperature",
	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 9600),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6132" = nlist(
	"name",      	"ChkSmartSelftest",
	"descr",     	"Check if any smart SELF tests have failed",
	"class",     	"smart.SELFtest",
	"period",    	86400,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 9600),
	"active",    	false,
	"latestonly",	false,
);

#
# Error codes below 20 are not fatal but are logged for warning
# and history tracking
#