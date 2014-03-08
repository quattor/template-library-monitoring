############################################################
#
# template monitoring/lemon/metric/mpt
#
############################################################

template monitoring/lemon/metric/mpt;

"/system/monitoring/metric/_6122" = nlist(
	"name",      	"ChkRaidMpt",
	"descr",     	"Problem with Mpt RAID controller or disks",
	"class",     	"mpt.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);