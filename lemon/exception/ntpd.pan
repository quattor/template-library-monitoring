template monitoring/lemon/exception/ntpd;


"/system/monitoring/exception/_30026" = nlist(
	"name",      	"ntpd_wrong",
	"descr",     	"Ntp daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"ntpd_wrong",
	"correlation",	"5033:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service ntpd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

