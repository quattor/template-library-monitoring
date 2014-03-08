# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/nfsstatus;


"/system/monitoring/metric/_20151" = nlist(
        "name",         "NfsCalls",
        "descr",        "Bad calls/ calls",
        "class",        "NfsStatus.Calls",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20152" = nlist(
        "name",         "NfsPacketLost",
        "descr",        "Packet Lost",
        "class",        "NfsStatus.PacketLost",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20153" = nlist(
        "name",         "NfsThread",
        "descr",        "the last 4 thread were 100% busy during this time",
        "class",        "NfsStatus.Threads",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20154" = nlist(
        "name",         "NfsRpcNfs",
        "descr",        "NFS running ?",
        "class",        "NfsStatus.RpcNfs",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_20155" = nlist(
        "name",         "NfsRpcMountd",
        "descr",        "mountd running ?",
        "class",        "NfsStatus.RpcMountd",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_20156" = nlist(
        "name",         "NfsRpcPortmap",
        "descr",        "portmap running ?",
        "class",        "NfsStatus.RpcPortmap",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_20157" = nlist(
        "name",         "NfsRpcRquotad",
        "descr",        "quotad running ?",
        "class",        "NfsStatus.RpcRquotad",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);
"/system/monitoring/metric/_20158" = nlist(
        "name",         "NfsRpcNlockmgr",
        "descr",        "nlockmgr running ?",
        "class",        "NfsStatus.RpcNlockmgr",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);


# End-of-File
