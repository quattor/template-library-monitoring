template monitoring/lemon/exception/castor1_stager;


"/system/monitoring/exception/_30322" = nlist(
	"name",      	"cdbserver_wrong",
	"descr",     	"castor DB server dead",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"cdbserver_wrong",
	"correlation",	"4002:1 != 1"
);





"/system/monitoring/exception/_30321" = nlist(
	"name",      	"stgdaemon_wrong",
	"descr",     	"stgdaemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"stgdaemon_wrong",
	"correlation", 	"4004:1 < 0 || 4004:1 > 20"
);

