template monitoring/lemon/exception/sindes;


"/system/monitoring/exception/_30106" = nlist(
    "name",         "SINDES_renewal_wrong",
    "descr",        "SINDES cannot renew local client certificate",
    "active",       true,
    "latestonly",   false,
    "importance",   3,
    "alarmtext",    "SINDES_renewal_wrong",
    # 1 error in the log
    "correlation",  "5105:1 != 0",
    "silent",       true
);

