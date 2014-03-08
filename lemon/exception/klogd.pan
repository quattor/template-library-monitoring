template monitoring/lemon/exception/klogd;


"/system/monitoring/exception/_30032" = nlist(
	"name",      	"klogd_wrong",
	"descr",     	"Klog daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"klogd_wrong",
	"correlation",	"4003:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service syslog start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

