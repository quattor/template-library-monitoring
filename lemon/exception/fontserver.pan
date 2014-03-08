template monitoring/lemon/exception/fontserver;


"/system/monitoring/exception/_30014" = nlist(
	"name",      	"fontsevice_problem",
	"descr",     	"font service wrong",
	"active",   	true,
	"latestonly",	false,
	"importance", 	3,
	"minoccurs",	2,
    "alarmtext", 	"fontservice_problem",
	"correlation",	"4331:1 != 1",
	"actuator", 	nlist("execve",  "/sbin/service xfs restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);


