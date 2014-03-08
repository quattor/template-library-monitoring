############################################################
#
# template monitoring/lemon/metric/nfs
#
############################################################

template monitoring/lemon/metric/nfs;

"/system/monitoring/metric/_4017" = nlist(
        "name",         "nfsd",
        "descr",        "NFS daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "nfsd", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_4020" = nlist(
        "name",         "rpc.mountd",
        "descr",        "NFS rpc.mount daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "rpc.mountd", "uid", "0", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       false,
        "latestonly",   false,
);"/system/monitoring/metric/_5030" = nlist(
        "name",         "rpc_statd",
        "descr",        "\"rpc.statd\" daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "rpc.statd", "uid", "rpcuser"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   true,
);