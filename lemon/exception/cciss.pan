template monitoring/lemon/exception/cciss;


"/system/monitoring/exception/_30513" = nlist(
	"name",      	"raid_cciss",
	"descr",     	"Problem with Cciss RAID controller or disks",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_cciss",
	"correlation",  "6121:1!=0 && 6121:2 ne 'OK'"
);

