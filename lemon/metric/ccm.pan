############################################################
#
# template monitoring/lemon/metric/ccm
#
############################################################

template monitoring/lemon/metric/ccm;

"/system/monitoring/metric/_5103" = nlist(
    "name",       "CCM_log_error",
    "descr",      "Check for errors in CCM log",
    "class",      "log.Parse",
    "param",      list("logfile",   "/var/log/ccm-fetch.log",
                       "istring",   "[ERROR]",
                       "sincelast", "3h",
                       "dformat",   "%Y/%m/%d-%T"),
    # sampling every 3 hours
    "period",     10800,
    # smoothing over 30 hours
    "smooth",     nlist("typeString", false, "maxdiff", 0.0, "maxtime", 108000),
    "active",     true,
    "latestonly", false
);

"/system/monitoring/metric/_5104" = nlist(
    "name",       "CCM_timestamp_check",
    "descr",      "Check for old CCM execution timestamp",
    "class",      "file.sslmtime",
    "param",      list("file", "/var/lib/ccm/latest.cid"),
    # one sample per day
    "period",     86400,
    # smoothing over 30 days
    "smooth",     nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
    "active",     true,
    "latestonly", false
);