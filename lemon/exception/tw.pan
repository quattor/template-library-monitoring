template monitoring/lemon/exception/tw;


"/system/monitoring/exception/_30515" = nlist(
	"name",      	"raid_tw",
	"descr",     	"Problem with 3ware RAID controller or disks",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_tw",
	"correlation",  "6123:1>19 && 6123:2 ne 'OK'"
);

