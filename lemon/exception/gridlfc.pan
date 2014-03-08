template monitoring/lemon/exception/gridlfc;


"/system/monitoring/exception/_30051" = nlist(
	"name",      	"lfcdaemon_wrong",
	"descr",     	"lfc daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"lfcdaemon_wrong",
	"correlation",	"39:1 != 1"
);




"/system/monitoring/exception/_30059" = nlist(
	"name",      	"lfc_dli_daemon_wrong",
	"descr",     	"lfc-dli daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"lfc_dli_wrong",
	"correlation",	"42:1 != 1"
);





"/system/monitoring/exception/_30052" = nlist(
	"name",      	"lfc_db_error",
	"descr",     	"lfc log shows ORA error",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"LFC_DB_ERROR",
	"correlation",	"5201:1 != 0"
);




"/system/monitoring/exception/_30082" = nlist(
	"name",      	"lfc_noread",
	"descr",     	"Cannot read from LFC",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"lfc_noread",
	"correlation",	"5202:1 != 0"
);




"/system/monitoring/exception/_30083" = nlist(
	"name",      	"lfc_nowrite",
	"descr",     	"Cannot write to LFC",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"lfc_nowrite",
	"correlation",	"5203:1 != 0"
);




"/system/monitoring/exception/_30084" = nlist(
	"name",      	"lfc_slow_readdir",
	"descr",     	"Read operations on LFC are slow ",
	"active",    	true,
	"latestonly",	false,
	"importance",	2,
    	"alarmtext", 	"lfc_slow_readdir",
	"correlation",	"5204:1 > 10",
        "minoccurs",    3
);



"/system/monitoring/exception/_30075" = nlist(
        "name",         "lfc_noservice",
        "descr",        "LFC Service not available",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "local",        true,
        "correlation",  "39:1 != 1 || 5202:1 != 0 || 5203:1 != 0",
# JC - Christmas special - try and restart if all goes wrong
        "actuator",     nlist("execve",  "/bin/sh -c \\\\\"/usr/bin/killall -9 lfcdaemon; sleep 1; /sbin/service lfcdaemon start \\\\\"",
                          "maxruns", 3,
                          "timeout", 0,
                          "active",  true)
);

