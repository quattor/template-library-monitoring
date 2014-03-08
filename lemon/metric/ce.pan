# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/ce;



"/system/monitoring/metric/_4033" = nlist(
        "name",         "pbs_server",
        "descr",        "\"pbs_server\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "pbs_server", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_4034" = nlist(
        "name",         "maui",
        "descr",        "\"maui\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "maui", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_4035" = nlist(
        "name",         "gatekeeper",
        "descr",        "\"gatekeeper\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "gatekeeper", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


# End-of-File
