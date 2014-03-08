template monitoring/lemon/exception/hwscan;


"/system/monitoring/exception/_30535" = nlist(
	"name",      	"hwscan_wrong",
	"descr",     	"Missing hardware compared to CDB",
	"active",    	false,
	"latestonly",	false,
	"importance", 	3,
	"alarmtext",	"hwscan_wrong",
	"correlation",  "5102:1>59 && 5102:2 ne 'OK'",
        "minoccurs",    2,
);

