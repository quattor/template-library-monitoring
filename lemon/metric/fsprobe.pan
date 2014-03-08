###########################################################
#
# template monitoring/lemon/metric/fsprobe
#   Check the status of the file server probe daemons
#
############################################################

template monitoring/lemon/metric/fsprobe;

"/system/monitoring/metric/_6050" = nlist(
	"name",      	"FsprobeStatus",
	"descr",     	"Status of fsprobe daemons",
	"class",     	"fsprobe.status",
	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6051" = nlist(
	"name",      	"FsprobeStatistics",
	"descr",     	"Statistics of fsprobe results",
	"class",     	"fsprobe.statistics",
	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	true,
	"latestonly",	false,
);
