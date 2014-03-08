template monitoring/lemon/exception/tapeserver_smc;


"/system/monitoring/exception/_30074" = nlist(
	"name",	     	"rmcdaemon_wrong",
	"descr",    	"\"rmcdaemon\" tapeserver daemon wrong",
	"active",    	true,
	"importance",	3,
	"latestonly",	false,
	"period",    	60,
	"alarmtext", 	"rmcdaemon_wrong",
	"correlation", 	"6205:1 != 1",
);

