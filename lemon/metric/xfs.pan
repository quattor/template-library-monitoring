############################################################
#
# template monitoring/lemon/metric/xfs
#
############################################################

template monitoring/lemon/metric/xfs;

"/system/monitoring/metric/_4018" = nlist(
	"name",      	"xfsd",
	"descr",     	"X Font Server",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "", "uid", "0", "ppid", "1"),
	"period",   	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);