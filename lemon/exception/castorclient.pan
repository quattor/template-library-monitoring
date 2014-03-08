template monitoring/lemon/exception/castorclient;


"/system/monitoring/exception/_30018" = nlist(
	"name",      	"rfiod_wrong",
	"descr",     	"Rfio daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
   	"alarmtext", 	"rfiod_wrong",
	"correlation",	"35:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service rfiod start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);




"/system/monitoring/exception/_30062" = nlist(
	"name",      	"rootd_wrong",
	"descr",     	"Root daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"rootd_wrong",
	"correlation",	"38:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service rootd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);

