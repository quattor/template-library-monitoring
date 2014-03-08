template monitoring/lemon/exception/mpt;


"/system/monitoring/exception/_30514" = nlist(
	"name",      	"raid_mpt",
	"descr",     	"Problem with Mpt RAID controller or disks",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_mpt",
	"correlation",  "6122:1!=0 && 6122:2 ne 'OK'"
);

