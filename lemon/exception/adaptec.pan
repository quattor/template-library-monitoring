template monitoring/lemon/exception/adaptec;


"/system/monitoring/exception/_30521" = nlist(
	"name",      	"raid_adaptec",
	"descr",     	"Problem with Adaptec RAID controller or disks",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_adaptec",
	"correlation",  "6127:1>19 && 6127:2 ne 'OK'"
);

