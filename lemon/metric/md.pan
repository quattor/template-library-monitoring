############################################################
#
# template monitoring/lemon/metric/md
#
############################################################

template monitoring/lemon/metric/md;

"/system/monitoring/metric/_6125" = nlist(
	"name",      	"ChkRaidMd",
	"descr",     	"Problem with software RAID or disks",
	"class",     	"md.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	true,
	"latestonly",	false,
);