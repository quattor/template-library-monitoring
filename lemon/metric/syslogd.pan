############################################################
#
# template monitoring/lemon/metric/syslogd
#
############################################################

template monitoring/lemon/metric/syslogd;

"/system/monitoring/metric/_4014" = nlist(
	"name",      	"syslogd",
	"descr",     	"\"syslogd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "syslogd", "uid", "0", "ppid", "1"),
	"period",    	60,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",   	true,
	"latestonly",	true,
);