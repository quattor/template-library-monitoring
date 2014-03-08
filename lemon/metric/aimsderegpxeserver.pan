############################################################
#
# template monitoring/lemon/metric/aimsderegpxeserver
#
############################################################

template monitoring/lemon/metric/aimsderegpxeserver;

"/system/monitoring/metric/_29" = nlist(
	"name",      	"aimsderegpxeserver",
	"descr",     	"the AIMS PXE de-registration daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "aims-deregpxe-s"),  # from /proc/pid/status, cutoff
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);