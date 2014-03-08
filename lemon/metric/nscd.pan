############################################################
#
# template monitoring/lemon/metric/nscd
#
############################################################

template monitoring/lemon/metric/nscd;

"/system/monitoring/metric/_5032" = nlist(
	"name",      	"nscd",
	"descr",     	"\"nscd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "nscd", "uid", "nscd", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	true,
);