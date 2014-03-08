#
# monitoring/metric/vomrs
#

template monitoring/lemon/metric/vomrs;

"/system/monitoring/metric/_5226" = nlist(
        "name" ,        "vomrs_ping_alarms_modification",
        "descr",        "Last modification time of the vomrs-ping.alarm file",
        "class",        "file.sslmtime",
        "param",        list("file", "/var/log/vomrs/vomrs-ping.alarm"),
        "period",       600,
        "active",       true,
        "latestonly",   true
);