template monitoring/lemon/exception/qla;


"/system/monitoring/exception/_30536" = nlist(
	"name",      	"qla_port",
	"descr",     	"Problem with Qlogic fibre channel controller or port",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"raid_qla",
	"correlation",  "6140:3>19 && 6140:4 ne 'OK'"
);


