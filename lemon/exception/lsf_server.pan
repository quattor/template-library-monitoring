template monitoring/lemon/exception/lsf_server;


"/system/monitoring/exception/_30050" = nlist(
	"name",      	"var_lsf_full",
	"descr",     	"/var/lsf utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"alarmtext", 	"var_lsf_full",
	"correlation",	"((9104:1 eq '/var/lsf') && (9104:5 > 80))"
);

