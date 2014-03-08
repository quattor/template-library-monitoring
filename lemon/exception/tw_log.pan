template monitoring/lemon/exception/tw_log;


"/system/monitoring/exception/_30516" = nlist(
        "name",         "raid_tw_ctlr",
        "descr",        "3ware controller card problem",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
        "alarmtext",    "raid_tw_ctlr",
        "correlation",  "6124:1 != 0"
);



"/system/monitoring/exception/_30518" = nlist(
        "name",         "raid_tw_disk",
        "descr",        "3ware disk problem",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
        "alarmtext",    "raid_tw_disk",
        "correlation",  "6126:1 > 5"
);





