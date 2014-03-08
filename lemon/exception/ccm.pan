template monitoring/lemon/exception/ccm;


"/system/monitoring/exception/_30105" = nlist(
    "name",         "CCM_wrong",
    "descr",        "CCM not working properly",
    "active",       true,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "CCM_wrong",
    # errors in the log || 14 days since the last CCM update
    "correlation",  "5103:1 != 0 || 5104:1 > 1209600",
    "silent",       true,
);

