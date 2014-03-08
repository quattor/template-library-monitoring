############################################################
#
# template monitoring/lemon/metric/named
#
############################################################

template monitoring/lemon/metric/named;

"/system/monitoring/metric/_44" = nlist(
	"name",      	"named",
	"descr",     	"\"named\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "named", "uid", "25", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);