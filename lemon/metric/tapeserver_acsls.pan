############################################################
#
# template monitoring/lemon/metric/tapeserver_acsls
#
#  metrics specific to STK ACLS installations - JvE / Jan 19, 2005
#
############################################################

template monitoring/lemon/metric/tapeserver_acsls;

"/system/monitoring/metric/_6201" = nlist(
	"name",      	"mini_el",
	"descr",     	"\"mini_el\" tapeserver daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "mini_el", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_6202" = nlist(
	"name",      	"ssi",
	"descr",     	"\"ssi\" tapeserver daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "ssi", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);