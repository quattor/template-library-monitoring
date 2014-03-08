############################################################
#
# template monitoring/lemon/metric/oramon
#
############################################################

template monitoring/lemon/metric/oramon;

"/system/monitoring/metric/_4301" = nlist(
	"name",      	"lemon-server",
	"descr",     	"The Lemonserver",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "lemon-server", "uid", "17841 0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);