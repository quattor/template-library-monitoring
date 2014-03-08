template monitoring/lemon/exception/castor2_xrootd;


"/system/monitoring/exception/_30349" = nlist(
        "name",         "c2_xrd_wrong",
        "descr",        "Castor-2 xrootd \"xrd\" daemon problem",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "c2_xrd_wrong",
        "correlation",  "6526:1 < 1", 
        "actuator",     nlist("execve",  "/sbin/service xrd restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);


"/system/monitoring/exception/_30359" = nlist(
        "name",         "c2_olb_wrong",
        "descr",        "Castor-2 xrootd \"olb\" daemon problem",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "c2_olb_wrong",
        "correlation",  "6527:1 < 1", 
        "actuator",     nlist("execve",  "/sbin/service olb restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);

