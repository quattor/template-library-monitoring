#
# This file contains the default metrics for the linux sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/wn;


#"/system/monitoring/metric/_30050" = nlist(
#        "name",         "exitCodeNFS",
#        "descr",        "df exitCode checking NFS",
#        "class",        "system.exitCode",
#        "param",        list("cmdline", "/usr/local/lemon/nfs_test.sh", "timeout", "6"),
#        "period",       300,
#        "smooth",       nlist("typeString", false, "maxdiff", 3.0, "maxtime", 3600),
#        "active",       true,
#        "latestonly",   false,
#);

"/system/monitoring/metric/_4032" = nlist(
        "name",         "pbs_mom",
        "descr",        "\"pbs_mom\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "pbs_mom", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);

#"/system/monitoring/metric/_30052" = nlist(
#        "name",         "NFS ok",
#        "descr",        "are the soft area mounted?",
#        "class",        "file.spaceUsed",
#        "param",        list("dir", "/opt/exp_soft/ops"),
#        "period",       900,
#        "smooth",       nlist("typeString", false, "maxdiff", 0.0,"maxtime", 36000),
#        "active",       true,
#        "latestonly",   false,
#);



#"/system/monitoring/metric/_30053" = nlist(
#        "name",         "NFS ok",
#        "descr",        "are the soft area mounted?",
#        "class",        "file.writeable",
#        "param",        list("file", "/opt/exp_soft/ops/toto"),
#        "period",       900,
#        "smooth",       nlist("typeString", false, "maxdiff", 0.0,"maxtime", 36000),
#        "active",       true,
#        "latestonly",   false,
#);



# End-of-File
