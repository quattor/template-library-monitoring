############################################################
#
# template monitoring/lemon/metric/crond
#
############################################################

template monitoring/lemon/metric/crond;

"/system/monitoring/metric/_43" = nlist(
	"name",      	"crond",
	"descr",     	"The should be one, and only one, crond daemon running",
	"class",     	"system.numberOfProcesses",
   	"param",     	list("name", "crond", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);