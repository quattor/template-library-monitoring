template monitoring/lemon/exception/smart;

"/system/monitoring/exception/_30522" = nlist(
	"name",      	"smart_failing",
	"descr",     	"Smart counters are failing",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"smart_failing",
	"correlation",  "6130:1>19 && 6130:2 ne 'OK'"
);



"/system/monitoring/exception/_30523" = nlist(
	"name",      	"smart_SELFtest",
	"descr",     	"Smart SELF tests have failed",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"smart_SELFtest",
	"correlation",  "6132:1>19 && 6132:2 ne 'OK'"
);

