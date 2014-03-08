############################################################
#
# template monitoring/lemon/metric/netdumpserver
#
############################################################

template monitoring/lemon/metric/netdumpserver;

"/system/monitoring/metric/_67" = nlist(
	"name",      	"netdumpserver",
	"descr",     	"the server-side netdump daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "netdump-server"), # from /proc/pid/status, cutoff
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);