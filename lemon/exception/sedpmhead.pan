template monitoring/lemon/exception/sedpmhead;


"/system/monitoring/exception/_30401" = nlist(
	"name",         "procrfiod",
	"descr",        "rfiod not running",
	"active",       true,
	"latestonly",   true,
	"importance",   2,
	"correlation",  "401:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30402" = nlist(
        "name",         "procgsiftp",
        "descr",        "gsiftp not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "402:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30403" = nlist(
        "name",         "procdpm",
        "descr",        "dpm not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "403:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30404" = nlist(
        "name",         "procsrmv1",
        "descr",        "srmv1 not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "404:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30405" = nlist(
        "name",         "procsrmv2",
        "descr",        "rfiod not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "405:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30406" = nlist(
        "name",         "procsrmv2.2",
        "descr",        "srmv2.2 not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "406:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);


"/system/monitoring/exception/_30407" = nlist(
        "name",         "procdpnsdaemon",
        "descr",        "dpnsdaemon not running",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "407:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/dpm_proc_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);





# End-of-File
