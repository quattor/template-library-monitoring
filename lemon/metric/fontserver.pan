############################################################
#
# template monitoring/lemon/metric/fontserver
#
############################################################

template monitoring/lemon/metric/fontserver;

"/system/monitoring/metric/_4331" = nlist(
	"name",      	"fontservice",
	"descr",     	"Check if all necessary XFS daemons are running",
	"class",     	"FIO::FontService",
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);# These metrics are for statistical purposes (and later wille be used for lb 
# load checking)
"/system/monitoring/metric/_4332" = nlist(
	"name", "xfs_7100",
	"descr", "Counts the number of TCP streams established on port 7100",
	"class", "netstat.tcpsessions",
	"param", list("port", "7100"),
	"period", 300,
	"active", true,
	"latestonly", false,
);

"/system/monitoring/metric/_4333" = nlist(
	"name", "xfs_total",
	"descr", "Counts the overall number of TCP streams established to the xfs",
	"class", "netstat.tcpsessions",
	"param", list("program", "xfs"),
	"period", 300,
	"active", true,
	"latestonly", false,
);
