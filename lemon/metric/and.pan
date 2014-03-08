############################################################
#
# template monitoring/lemon/metric/and
#
############################################################

template monitoring/lemon/metric/and;

"/system/monitoring/metric/_4023" = nlist(
	"name",      	"and_status",
        "descr",     	"the \"Auto Nice Daemon\", and",
        "class",     	"system.numberOfProcesses", 
        "param",     	list("name", "and", "uid", "0"),
        "period",    	60, 
        "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",    	true,
        "latestonly",	false,
);