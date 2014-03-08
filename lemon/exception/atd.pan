template monitoring/lemon/exception/atd;


"/system/monitoring/exception/_30024" = nlist(
	"name",      	"atd_wrong",
	"descr",     	"At daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"atd_wrong",
	"correlation",	"4008:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service atd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);


