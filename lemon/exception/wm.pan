template monitoring/lemon/exception/wm;


"/system/monitoring/exception/_30108" = nlist(
        "name",         "ns_wrong",
        "descr",        "Number of network server process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "ns_wrong",  
        "correlation",  "5240:1 < 1", 
        "actuator",     nlist("execve",  "", 
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30109" = nlist(
        "name",         "wm_wrong",
        "descr",        "Number of workload manager process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "wm_wrong",  
        "correlation",  "5241:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30110" = nlist(
        "name",         "jobcontroller_wrong",
        "descr",        "Number of job controller process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "jobcontroller_wrong",  
        "correlation",  "5242:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30111" = nlist(
        "name",         "condormaster_wrong",
        "descr",        "Number of Condor master process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "condormaster_wrong",  
        "correlation",  "5243:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30112" = nlist(
        "name",         "condorschedd_wrong",	
        "descr",        "Number of Condor scheduler process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "condorschedd_wrong",  
        "correlation",  "5244:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30113" = nlist(
        "name",         "logd_wrong",
        "descr",        "Number of logd process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "logd_wrong",  
        "correlation",  "5245:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30114" = nlist(
        "name",         "interlogd_wrong",
        "descr",        "Number of interlogd process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "interlogd_wrong",  
        "correlation",  "5246:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30115" = nlist(
        "name",         "bkserverd_wrong",
        "descr",        "Number of bkserverd process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "bkserverd_wrong",  
        "correlation",  "(5247:1 < 1) || (5247:1 > 11)",
);




"/system/monitoring/exception/_30116" = nlist(
        "name",         "renewd_wrong",
        "descr",        "Number of renewd process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "renewd_wrong",  
        "correlation",  "5248:1 != 2",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30117" = nlist(
        "name",         "lm_wrong",
        "descr",        "Number of log monitor process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "lm_wrong",  
        "correlation",  "5249:1 < 1",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30119" = nlist(
        "name",         "ftpd_wrong",
        "descr",        "Number of ftpd processes wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "ftpd_wrong",  
        "correlation",  "(5251:1 < 1) || (5251:1 > 2000) ",
        "actuator",     nlist("execve",  "",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30120" = nlist(
        "name",         "dglogd_high",
        "descr",        "Number of dg20logd files too high.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "dglogd_high",  
        "correlation",  "5252:1 > 1000",
);




"/system/monitoring/exception/_30121" = nlist(
        "name",         "inputfl_size",
        "descr",        "Size of the input.fl too high.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "inputfl_size",  
        "correlation",  "5253:1 > 1610612736",
);




"/system/monitoring/exception/_30122" = nlist(
        "name",         "queuefl_size",
        "descr",        "Size of the queue.fl too high.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "queuefl_size",  
        "correlation",  "5254:1 > 1610612736",
);



"/system/monitoring/exception/_30124" = nlist(
        "name",         "logs_full",
        "descr",        "Middleware log files partition (/data01) full.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "logs_full",  
        "correlation",  "(9104:1 eq '/data01') && (9104:5 > 90)",
);


"/system/monitoring/exception/_30125" = nlist(
        "name",         "sandbox_full",
        "descr",        "Sandbox partition (/data02) full).",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "sandbox_full",  
        "correlation",  "(9104:1 eq '/data02') && (9104:5 > 90)",
);


"/system/monitoring/exception/_30126" = nlist(
        "name",         "mysql_full",
        "descr",        "MySQL partition (/data03) full).",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "mysql_full",  
        "correlation",  "(9104:1 eq '/data03') && (9104:5 > 90)",
);

