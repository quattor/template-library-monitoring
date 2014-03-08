template monitoring/lemon/exception/cups;


"/system/monitoring/exception/_30057" = nlist(
	"name",      	"cupsd_wrong",
	"descr",     	"cups daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"cupsd_wrong",
	"correlation",	"32:1 < 1",
	"actuator", 	nlist("execve",  "/etc/init.d/cups restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

