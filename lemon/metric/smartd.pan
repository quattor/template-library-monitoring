############################################################
#
# template monitoring/lemon/metric/smartd
#
############################################################

template monitoring/lemon/metric/smartd;

"/system/monitoring/metric/_4022" = nlist(
         "name",      	"smartd",
         "descr",     	"The should be one, and only one, smart daemon running",
         "class",     	"system.numberOfProcesses",
         "param",     	list("name", "smartd", "uid", "0", "ppid", "1"),
         "period",    	3600,
         "smooth",   	 nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
         "active",    	true,
         "latestonly",	false,
);