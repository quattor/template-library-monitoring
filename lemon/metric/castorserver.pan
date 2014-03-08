############################################################
#
# template monitoring/lemon/metric/castorserver
#
############################################################

template monitoring/lemon/metric/castorserver;

"/system/monitoring/metric/_6232" = nlist(
	"name",      	"nsdaemon",
	"descr",     	"the Castor \"nsdaemon\" Name Server daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "nsdaemon", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_6234" = nlist(
	"name",      	"vmgrdaemon",
	"descr",     	"the Castor \"VMGR\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "vmgrdaemon", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_6235" = nlist(
	"name",      	"Cupvdaemon",
	"descr",     	"the Castor \"Cupv\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "Cupvdaemon", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);#"/system/monitoring/metric/_6236" = nlist(
#	"name",      	"msgdaemon",
#	"descr",     	"the Castor \"msgdaemon\" daemon",
#	"class",     	"system.numberOfProcesses",
#    	"param",     	list("name", "msgdaemon", "uid", "0", "ppid", "1"),
#	"period",    	60,
#    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
#	"active",    	false,
#	"latestonly",	false,
#);

"/system/monitoring/metric/_6238" = nlist(
	"name",      	"vdqm",
	"descr",     	"the Castor \"VDQM\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "vdqmserv", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);