############################################################
#
# template monitoring/lemon/metric/distcc
#
############################################################

template monitoring/lemon/metric/distcc;

"/system/monitoring/metric/_47" = nlist(
	"name",      	"distccd",
	"descr",     	"\"distcc\" distributed compilation daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "distccd", "uid", "21280"),
	"period",    	60,
    	"smooth",   	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);