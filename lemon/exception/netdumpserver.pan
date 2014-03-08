template monitoring/lemon/exception/netdumpserver;


"/system/monitoring/exception/_30065"=nlist(
	"name",      	"netdumpserver_wrong",
	"descr",     	"netdump-server daemon not running",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"netdump-server-not-running-despite-restarts-do-something-about-it",
	"correlation",	"67:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service netdump-server restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

