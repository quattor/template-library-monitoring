template monitoring/lemon/exception/crond;


"/system/monitoring/exception/_30021" = nlist(
	"name",      	"crond_wrong",
	"descr",     	"Cron daemon wrong",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"crond_wrong",	
	"correlation",	"43:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service crond start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

