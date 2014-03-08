template monitoring/lemon/exception/oramon;



"/system/monitoring/exception/_30901" = nlist(
	"name",      	"oramon_wrong",
	"descr",     	"Lemon server daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"oramon_wrong",
	"correlation",	"4301:1 != 1",
);


