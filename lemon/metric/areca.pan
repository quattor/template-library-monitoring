############################################################
#
# template monitoring/lemon/metric/areca
#
############################################################

template monitoring/lemon/metric/areca;

"/system/monitoring/metric/_6120" = nlist(
	"name",      	"ChkRaidAreca",
	"descr",     	"Problem with Areca RAID controller or disks",
	"class",     	"areca.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);