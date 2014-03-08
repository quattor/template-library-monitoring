template monitoring/lemon/exception/console;


"/system/monitoring/exception/_30201" = nlist(
	"name",      	"serial_card",
	"descr",     	"serial card connection",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"serial_card_error",
	"correlation",	"5128:1 != 0"
);




"/system/monitoring/exception/_30042" = nlist(
	"name",      	"consoled_wrong",
	"descr",     	"console daemon wrong",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"consoled_wrong",
	"correlation",	"5129:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service slac-console-server start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);


