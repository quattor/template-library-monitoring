############################################################
#
# template monitoring/lemon/metric/aimsdhcpdreloader
#
############################################################

template monitoring/lemon/metric/aimsdhcpdreloader;

"/system/monitoring/metric/_28" = nlist(
	"name",      	"aimsdhcpdreloader",
	"descr",     	"the AIMS dhcpd-reloader daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "aims-dhcpd-relo"), # from /proc/pid/status, cutoff
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);