template monitoring/lemon/exception/security;


"/system/monitoring/exception/_32004" = nlist(
        "name",         "ld_so_preload",
        "descr",        "/etc/ld.so.preload present",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ld_so_preload",
        "correlation",  "5037:1 != -1"
);

