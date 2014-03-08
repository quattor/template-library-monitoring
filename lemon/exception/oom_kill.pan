template monitoring/lemon/exception/oom_kill;


"/system/monitoring/exception/_30058" = nlist(
	"name",      	"oom_kill_wrong",
	"descr",     	"oom_kill daemon wrong",
	"active",   	true,
	"latestonly"	,false,
	"importance",	1,
	"correlation",	"41:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service oom_kill start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

