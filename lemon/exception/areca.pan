template monitoring/lemon/exception/areca;


"/system/monitoring/exception/_30512" = nlist(
	"name",      	"raid_areca",
	"descr",     	"Problem with Areca RAID controller or disks",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_areca",
	"correlation",  "6120:1>=20 && 6120:2 ne 'OK'"
);

