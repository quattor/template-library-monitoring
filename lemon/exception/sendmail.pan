template monitoring/lemon/exception/sendmail;


"/system/monitoring/exception/_30033" = nlist(
	"name",      	"sendmail_wrong",
	"descr",     	"Sendmail daemon wrong",
	"active",    	true,
	"latestonly",	false,
        "minoccurs",    3,
	"importance", 	2,
   	"alarmtext", 	"sendmail_wrong",
	"correlation",	"4012:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service sendmail start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);


