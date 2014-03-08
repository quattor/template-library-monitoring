############################################################
#
# template monitoring/lemon/metric/portmap
#
############################################################

template monitoring/lemon/metric/portmap;

"/system/monitoring/metric/_4013" = nlist(
	"name",      	"portmap",
	"descr",     	"\"portmap\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "portmap", "uid", "rpc", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",   	true,
	"latestonly",	true,
);