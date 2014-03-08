template monitoring/lemon/exception/named;


"/system/monitoring/exception/_30028" = nlist(
	"name",      	"named_wrong",
	"descr",     	"Name daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"named_wrong",
	"correlation",	"44:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service named restart",
			      "maxruns", 3,
		  	      "timeout", 0,
			      "active",  true)
);

