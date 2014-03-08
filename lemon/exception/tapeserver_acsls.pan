template monitoring/lemon/exception/tapeserver_acsls;


"/system/monitoring/exception/_30035" = nlist(
	"name",      	"mini_el_wrong",
	"descr",     	"mini_el tapeserver daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"mini_el_wrong",
	"correlation",	"6201:1 != 1",
	"actuator", 	nlist("execve",  "/sbin/service mini_el start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);




"/system/monitoring/exception/_30036" = nlist(
	"name",      	"ssi_wrong",
	"descr",     	"ssi tapeserver daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"ssi_wrong",
	"correlation",	"6202:1 != 1",
	"actuator", 	nlist("execve",  "/sbin/service ssi start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

