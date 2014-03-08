############################################################
#
# template monitoring/lemon/metric/oom_kill
#
############################################################

template monitoring/lemon/metric/oom_kill;

"/system/monitoring/metric/_41" = nlist(
	"name",      	"oom_kill",
	"descr",     	"The should be only one oom_kill daemon running.",
	"class",    	"system.numberOfProcesses",
        "param",     	list("cmdline", "python /usr/lib/oom_kill/bin/oom_kill", "uid", "0", "ppid", "1"),
	"period",    	300,
        "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);