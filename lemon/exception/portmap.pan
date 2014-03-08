template monitoring/lemon/exception/portmap;


"/system/monitoring/exception/_30025" = nlist(
	"name",      	"portmap_wrong",
	"descr",     	"Portmap daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"portmap_wrong",
	"correlation",	"4013:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service portmap restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

