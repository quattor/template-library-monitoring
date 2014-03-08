template monitoring/lemon/exception/nscd;


"/system/monitoring/exception/_30015" = nlist(
	"name",      	"nscd_wrong",
	"descr",     	"Nsc daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"nscd_wrong",
	"correlation",	"5032:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service nscd restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);

