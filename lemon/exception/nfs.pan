template monitoring/lemon/exception/nfs;


"/system/monitoring/exception/_30030" = nlist(
        "name",         "nfs_server_wrong",
        "descr",        "one of the NFS daemons is down",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "NFS service (nfsd and/or rpc.mountd) is down",
        "correlation",  "4017:1 < 1 || 4020:1 < 1",
        "actuator",     nlist("execve", "/sbin/service nfs restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active", true)
);





"/system/monitoring/exception/_30029" = nlist(
        "name",         "rpc_statd_wrong",
        "descr",        "Rpc.stat daemon is down",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "NFS lock service (rpc_statd) is down",
        "correlation",  "5030:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service nfslock restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);

