template monitoring/lemon/exception/apache;


"/system/monitoring/exception/_30040"=nlist(
	"name",      	"http_wrong",
	"descr",     	"http daemon wrong",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"httpd_wrong",
	"correlation",	"4019:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service httpd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

