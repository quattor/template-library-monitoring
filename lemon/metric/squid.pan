############################################################
#
# template monitoring/lemon/metric/squid
#
############################################################

template monitoring/lemon/metric/squid;

"/system/monitoring/metric/_31" = nlist(
	"name",      	"squid",
	"descr",     	"squid daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "squid", "uid", "0", "ppid", "1"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);