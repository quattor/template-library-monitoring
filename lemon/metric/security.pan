############################################################
#
# template monitoring/lemon/metric/security
#
############################################################

template monitoring/lemon/metric/security;

"/system/monitoring/metric/_5037" = nlist(
        "name",         "ld.so.preload.exist",
        "descr",        "/etc/ld.so.preload present",
        "class",        "file.size",
        "param",        list("file", "/etc/ld.so.preload"),
        "period",       600,
        "offset",       "300",
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 6000),
        "active",       true,
        "latestonly",   false,
);