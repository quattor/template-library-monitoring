template monitoring/lemon/exception/syslogd;


"/system/monitoring/exception/_30023" = nlist(
	"name",      	"syslogd_wrong",
	"descr",     	"Syslog daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"alarmtext", 	"syslogd_wrong",
	"correlation",	"4014:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service syslogd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

