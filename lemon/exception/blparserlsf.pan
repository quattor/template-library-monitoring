template monitoring/lemon/exception/blparserlsf;

        
"/system/monitoring/exception/_30089" = nlist(
        "name", 	"blparserlsf_wrong", 
        "descr", 	"BLParserLSF daemon wrong",
        "active", 	false,
        "latestonly",	false,
        "importance", 	1,
        "alarmtext", 	"blparserlsf_wrong",
        "correlation", "4024:1 < 4", 
        "actuator", 	nlist("execve", "/sbin/service BLParserLSF restart",
                	      "maxruns", 3,
                	      "timeout", 0,
                	      "active", true) 
);
        

