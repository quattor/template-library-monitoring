#
# This file contains the default metrics for the linux sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/se_dpm;

"/system/monitoring/metric/_401" = nlist(
        "name",         "DpmProcRfiod",
        "descr",        "\"rfiod\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "rfiod", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_402" = nlist(
        "name",         "DpmProcDpmgsiftp",
        "descr",        "\"dpm-ftpd\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "dpm-gsiftp", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_403" = nlist(
        "name",         "DpmProcDpm",
        "descr",        "\"dpm\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "dpm", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_404" = nlist(
        "name",         "DpmProcSrmv1",
        "descr",        "\"srmv1\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "srmv1", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_405" = nlist(
        "name",         "DpmProcSrmv2",
        "descr",        "\"srmv2\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "srmv2", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_406" = nlist(
        "name",         "DpmProcSrmv2.2",
        "descr",        "\"srmv2.2\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "srmv2.2", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_407" = nlist(
        "name",         "DpmProcDpnsdaemon",
        "descr",        "\"dpnsdaemon\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "dpnsdaemon", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);





# End-of-File
