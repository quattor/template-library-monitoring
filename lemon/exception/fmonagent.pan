template monitoring/lemon/exception/fmonagent;


"/system/monitoring/exception/_30902" = nlist(
	"name",      	"lemon_sensor_wrong",
	"descr",     	"Lemon sensor agents wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
        "offset", 	"10",
	"silent",	true,
	"correlation",	"10003:2 != 10003:3"
);




"/system/monitoring/exception/_30903" = nlist(
	"name",      	"lemon_agent_wrong",
	"descr",     	"Lemon agent and/or sensors misbehaving",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
        "offset", 	"10",
	"period",	300,
	"silent",	true,
	"correlation", 	"10004:1 > 1200 && (10004:7 > 10 || (10004:8 > 150000 && 4109:3 eq 'i386') || (10004:8 > 600000 && 4109:3 regex '64') || 10007:2 > 50 || 10007:3 > 10 || 10007:4 > 0)",
);




"/system/monitoring/exception/_30077" = nlist(
	"name",      	"nomorealarms.size",
	"descr",     	"/home/operator/nomorealarms present",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation",	"5007:1 != -1"
);


