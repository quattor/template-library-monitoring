############################################################
#
# template monitoring/lemon/metric/castor2_xrootd
#
############################################################

template monitoring/lemon/metric/castor2_xrootd;

"/system/monitoring/metric/_6526" = nlist(
        "name",         "c2_xrd_daemon",
        "descr",        "Castor-2 xrootd \"xrd\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name","xrootd","uid","stage","ppid","1"),
        "period",       60,
        "smooth",       nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",   3600),
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6527" = nlist(
        "name",         "c2_olb_daemon",
        "descr",        "Castor-2 xrootd \"olb\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name","olbd","uid","stage","ppid","1"),
        "period",       60,
        "smooth",       nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",   3600),
        "active",       false,
        "latestonly",   false,
);