template monitoring/lemon/exception/lumber;


"/system/monitoring/exception/_30136" = nlist(
	"name",		"process_heartbeat_stop",
	"descr",	"Some processes found stopped after a long time",
	"active",	true,
	"latestonly",	false,
	"importance",	3,
	"alarmtext",	"process_heartbeat_stop",
	"correlation",	"5300:2 == -1 && 5300:4 == 0",
	"silent",	true,
);

