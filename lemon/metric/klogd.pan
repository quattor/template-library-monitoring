############################################################
#
# template monitoring/lemon/metric/klogd
#
############################################################

template monitoring/lemon/metric/klogd;

"/system/monitoring/metric/_4003" = nlist(
	"name",      	"klogd",
	"descr",     	"\"klogd\" kernel logger daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "klogd", "uid", "0"),
	"period",    	60,
    	"smooth",   	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);