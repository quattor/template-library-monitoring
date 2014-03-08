############################################################
#
# template monitoring/lemon/metric/lbserver
#
############################################################

template monitoring/lemon/metric/lbserver;

"/system/monitoring/metric/_36" = nlist(
	"name",		"LoadBalancingDaemonWrong",
	"descr",	"Load Balancing Daemon wrong",
	"class",	"system.numberOfProcesses",
	"period",	60,
	"smooth",	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",	true,
	"latestonly",	false,
	"param",	list("name", "lbd", "uid", "0", "ppid", "1"),
);"/system/monitoring/metric/_5118" = nlist(
	"name",		"LoadBalancingUpdateFailed",
	"descr",	"Load Balancing Update failed",
	"class",	"log.Parse",
	"period",	600,
	"smooth",	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",	true,
	"latestonly",	true,
	"param", list(
		"logfile",   "/var/log/lb/lbd.log",
		"dformat",   "%b %d %T",
		"istring",   " failed: ",
		"sincelast", "15m"),
);"/system/monitoring/metric/_5117" = nlist(
	"name",		"LoadBalancingLogAge",
	"descr",	"Load Balancing Log Age",
	"class",	"file.sslmtime",
	"param",	list("file", "/var/log/lb/lbd.log"),
	"period",	550,
	"offset",	"510",
	"active",	true,
	"latestonly",	true,
	"local",	true,
);