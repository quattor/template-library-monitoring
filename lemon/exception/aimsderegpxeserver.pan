template monitoring/lemon/exception/aimsderegpxeserver;


"/system/monitoring/exception/_30044"=nlist(
	"name",      	"aimsderegpxeserver_wrong",
	"descr",     	"AIMS PXE de-registration daemon not running",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"aimsderegpxeserver_wrong",
	"correlation",	"29:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service aimsderegpxeserver start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

