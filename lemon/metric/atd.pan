############################################################
#
# template monitoring/lemon/metric/atd
#
############################################################

template monitoring/lemon/metric/atd;

"/system/monitoring/metric/_4008" = nlist(
	"name",      	"atd",
	"descr",     	"\"atd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "atd", "uid", "0 2", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);