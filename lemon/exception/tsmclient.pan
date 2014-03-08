template monitoring/lemon/exception/tsmclient;


"/system/monitoring/exception/_30047" = nlist(
	"name",      	"dsmcsched",
	"descr",     	"TSM dsmc sched wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
        "alarmtext", 	"tsm_dsmc_sched_wrong",
	"correlation",	"49:1 != 1",
        "offset",	"10",
	"actuator", 	nlist("execve",  "/sbin/service tsmclient restart",
		              "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

