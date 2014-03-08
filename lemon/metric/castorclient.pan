############################################################
#
# template monitoring/lemon/metric/castorclient
#
############################################################

template monitoring/lemon/metric/castorclient;

"/system/monitoring/metric/_35" = nlist(
	"name",      	"rfiod",
	"descr",     	"One \"rfiod\" daemon should be running as root",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "rfiod", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_38" = nlist(
	"name",      	"rootd",
	"descr",     	"One \"rootd\" daemon should be running as root",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "rootd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);