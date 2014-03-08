template monitoring/lemon/exception/oprofile;


"/system/monitoring/exception/_30053" = nlist(
        "name",      	"oprofiled_wrong",
        "descr",     	"oprofile daemon wrong",
        "active",    	true,
        "latestonly",	false,
        "importance", 	3,
    	"alarmtext", 	"oprofiled_wrong",
	"correlation",	"33:1 != 1",
        "actuator", 	nlist("execve",  "/usr/bin/opcontrol --start",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);

