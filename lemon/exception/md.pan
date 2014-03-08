template monitoring/lemon/exception/md;


"/system/monitoring/exception/_30517" = nlist(
	"name",      	"raid_md",
	"descr",     	"Problem with software RAID or disks",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_md",
	"correlation",  "6125:1!=0 && 6125:2 ne 'OK'"
);

