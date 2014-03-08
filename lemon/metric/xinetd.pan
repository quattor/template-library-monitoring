############################################################
#
# template monitoring/lemon/metric/xinetd
#
############################################################

template monitoring/lemon/metric/xinetd;

"/system/monitoring/metric/_5026" = nlist(
	"name",      	"xinetd",
	"descr",     	"\"xinetd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "xinetd", "uid", "0"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);