template monitoring/lemon/exception/squid;


"/system/monitoring/exception/_30017" = nlist(
	"name",      	"squid_wrong",
	"descr",     	"Squid daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"squid_wrong",
	"correlation",	"31:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service squid start",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);

