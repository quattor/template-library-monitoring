############################################################
#
# template monitoring/lemon/metric/castor1_stager
#
############################################################

template monitoring/lemon/metric/castor1_stager;

"/system/monitoring/metric/_4002" = nlist(
	"name",      	"Cdbserver",
	"descr",     	"Castor database server daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "Cdbserver", "uid", "0", "ppid", "1"),
 	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_4004" = nlist(
    	"name",      	"stgdaemon",
    	"descr",     	"\"stgdaemon\" stager daemon",
    	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "stgdaemon"),
    	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
    	"active",    	true,
    	"latestonly",	false,
);