template monitoring/lemon/exception/aimsdhcpdreloader;


"/system/monitoring/exception/_30043"=nlist(
	"name",      	"aimsdhcpdreloader_wrong",
	"descr",     	"AIMS dhcpd-reloader daemon not running",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"aims-dhcpd-reloader_wrong",
	"correlation",	"28:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service aims-dhcpd-reloader restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

