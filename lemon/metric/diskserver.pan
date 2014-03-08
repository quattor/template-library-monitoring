############################################################
#
# template monitoring/lemon/metric/diskserver
#
############################################################

template monitoring/lemon/metric/diskserver;

"/system/monitoring/metric/_9024" = nlist(
	"name",      	"rfiod_total",
	"descr",     	"count the total number of \"rfiod\" daemons running",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name","rfiod"),
	"period",    	300,
    	"smooth",    	nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",   3600),
	"active",    	true,
	"latestonly",	false,
);

