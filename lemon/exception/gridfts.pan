template monitoring/lemon/exception/gridfts;


"/system/monitoring/exception/_30090" = nlist(
        "name",         "fta_wrong",
        "descr",        "One (or more) of the FTS transfer service daemons is down",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
        "alarmtext",    "fta_wrong",
        "correlation",  "850:1 != -1",
        "actuator",     nlist("execve",  "/opt/glite/share/glite-data-transfer-scripts/fta-agent-restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true),
);





"/system/monitoring/exception/_30034" = nlist(
        "name",         "fts_stuck",
        "descr",        "The FTS web-application is not responding",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
        "alarmtext",    "fts_stuck",
        "correlation",  "851:1 != -1"
);


