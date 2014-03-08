############################################################
#
# template monitoring/lemon/metric/cciss
#
############################################################

template monitoring/lemon/metric/cciss;

"/system/monitoring/metric/_6121" = nlist(
	"name",      	"ChkRaidCciss",
	"descr",     	"Problem with Cciss RAID controller or disks",
	"class",     	"cciss.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);