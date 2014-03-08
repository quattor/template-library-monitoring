template monitoring/lemon/exception/tomcat;


"/system/monitoring/exception/_30055" = nlist(
	"name",      	"tomcat",
	"descr",     	"tomcat wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
        "alarmtext", 	"tomcat_wrong",
	"correlation",	"40:1 != 1",
        "offset",	"10",
	"actuator", 	nlist("execve",  "/sbin/service tomcat5 start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

