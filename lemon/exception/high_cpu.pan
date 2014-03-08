template monitoring/lemon/exception/high_cpu;
	

"/system/monitoring/exception/_30060" = nlist(
     	"name",         "cpu_high",
     	"descr",        "too much CPU is being used on this server node",
     	"active",       true,
     	"latestonly",   false,
     	"importance",   3,
     	"alarmtext",    "cpu_high",
	"correlation",	"9110:1 > 90"
);

