template monitoring/lemon/exception/linuxha;


"/system/monitoring/exception/_30097" = nlist(
	"name",      	"HeartbeatStatus_error",
	"descr",     	"High Availability Heartbeat status problem",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"HA_HEARTBEAT_WRONG",
	"correlation",	"849:1 <= 0"
);
