############################################################
#
# template monitoring/lemon/metric/oprofile
#
############################################################

template monitoring/lemon/metric/oprofile;

"/system/monitoring/metric/_33" = nlist(
	"name",      	"oprofiled",
	"descr",    	"oprofile daemon",
	"class",     	"system.numberOfProcesses",
        "param",     	list("name", "oprofiled", "uid", "0"),
       	"period",    	60,
       	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);