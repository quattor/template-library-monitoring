template monitoring/lemon/exception/vomrs;


"/system/monitoring/exception/_30132" = nlist(
        "name",         "vomrs_ping_alarm",
        "descr",        "vomrs-ping put an alarm in the vomrs-ping.alarm file",
        "active",       true,
        "latestonly",   false,
        "importance",   3,
        "alarmtext",    "vomrs-ping has found a problem with VOMRS",
        "correlation",  "5226:1 < 600"
);

