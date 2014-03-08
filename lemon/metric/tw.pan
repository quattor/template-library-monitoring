############################################################
#
# template monitoring/lemon/metric/tw
#   New implementation of the Chk3Ware RAID sensors
#
############################################################

template monitoring/lemon/metric/tw;

"/system/monitoring/metric/_6123" = nlist(
	"name",      	"ChkRaidTw",
	"descr",     	"Problem with 3ware RAID controller or disks",
	"class",     	"tw.raidstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);