template monitoring/lemon/exception/lpd;


"/system/monitoring/exception/_30087" = nlist(
	"name",	      	"lpd_wrong",
	"descr",      	"Line Printer Daemon wrong",
	"importance", 	2,
	"active",     	true,
	"latestonly", 	false,
	"alarmtext",  	"lpd_wrong",
	"correlation", 	"50:1 < 1"	
);




"/system/monitoring/exception/_30088" = nlist(
	"name",		"lpd2_wrong",
	"descr",	"\"lpd\" print to file error",
	"importance",	1,
	"active",	true,
	"latestonly",	false,
	"offset",	"510",
	"alarmtext",	"lpd2_wrong",
	"correlation",	"52:1>300 || 53:1 ne '69512ab23cf13da4be7b9275ffb52c0f'",
);

