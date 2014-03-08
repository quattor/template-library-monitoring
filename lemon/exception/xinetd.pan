template monitoring/lemon/exception/xinetd;


"/system/monitoring/exception/_30027" = nlist(
	"name",      	"xinetd_wrong",
	"descr",     	"Xinet daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"xinetd_wrong",
	"correlation",	"5026:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service xinetd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);

