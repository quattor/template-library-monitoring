############################################################
#
# template monitoring/lemon/metric/tsmclient
#
# Monitor a TSM client incremental backup
#
############################################################

template monitoring/lemon/metric/tsmclient;

"/system/monitoring/metric/_49" = nlist(
	"name",      	"dsmcsched",
	"descr",     	"dsmc scheduler running processes",
	"class",     	"system.numberOfProcesses",
        "param",     	list("cmdline", "/usr/bin/dsmc sched"),
	"period",    	3600,
        "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);