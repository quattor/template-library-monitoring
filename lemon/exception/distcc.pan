template monitoring/lemon/exception/distcc;


"/system/monitoring/exception/_30061" = nlist(
	"name",      	"distcc_wrong",
	"descr",     	"Distcc daemon not running",
	"active",    	true,
	"latestonly",	false,
	"importance", 	0,
    	"alarmtext", 	"distcc_wrong",
	"correlation",	"47:1 < 1",
	"silent",	true
);

