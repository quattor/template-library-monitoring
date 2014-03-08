template monitoring/lemon/exception/and;

        
"/system/monitoring/exception/_30019"=nlist(
        "name", 	"and_wrong", 
        "descr", 	"AND daemon wrong",
        "active", 	true,
        "latestonly",	false,
        "importance", 	1,
	"alarmtext",	"and_wrong",
        "correlation", 	"4023:1 < 1", 
        "actuator", 	nlist("execve",  "/sbin/service and start",
                	      "maxruns", 3,
                	      "timeout", 0,
                	      "active",  true) 
);
        

