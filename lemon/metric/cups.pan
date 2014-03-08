############################################################
#
# template monitoring/lemon/metric/cups
#
############################################################

template monitoring/lemon/metric/cups;

"/system/monitoring/metric/_32" = nlist(
	"name",      	"cupsd",
	"descr",     	"cups daemon",
	"class",     	"system.numberOfProcesses",
        "param",     	list("name", "cupsd", "uid", "0"),
       	"period",    	60,
      	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);