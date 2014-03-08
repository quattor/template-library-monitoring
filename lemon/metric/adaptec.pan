############################################################
#
# template monitoring/lemon/metric/adaptec
#
############################################################

template monitoring/lemon/metric/adaptec;

"/system/monitoring/metric/_6127" = nlist(
	"name",      	"ChkRaidAdaptec",
	"descr",     	"Problem with Adaptec RAID controller or disks",
	"class",     	"adaptec.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);