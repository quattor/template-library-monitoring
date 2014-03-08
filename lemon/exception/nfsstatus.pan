template monitoring/lemon/exception/nfsstatus;


"/system/monitoring/exception/_30154" = nlist(
	"name",         "rpcnfs",
	"descr",        "NFS problem",
	"active",       true,
	"latestonly",   true,
	"importance",   2,
	"correlation",  "20154:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/nfs_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30155" = nlist(
        "name",         "rpcmountd",
        "descr",        "NFS problem",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "20154:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/nfs_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30156" = nlist(
        "name",         "rpcportmap",
        "descr",        "NFS problem",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "20154:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/nfs_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30157" = nlist(
        "name",         "rpcrquotad",
        "descr",        "NFS problem",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "20154:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/nfs_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30158" = nlist(
        "name",         "rpcnlockmgr",
        "descr",        "NFS problem",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "20154:1 < 1",
        "actuator",     nlist("execve",  "/usr/local/lemon/nfs_error.sh",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);





# End-of-File
