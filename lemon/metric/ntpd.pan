############################################################
#
# template monitoring/lemon/metric/ntpd
#
############################################################

template monitoring/lemon/metric/ntpd;

"/system/monitoring/metric/_5033" = nlist(
	"name",      	"ntpd",
	"descr",     	"\"ntpd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "ntpd", "uid", "ntp", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);