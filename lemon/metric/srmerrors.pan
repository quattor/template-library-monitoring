############################################################
#
# template monitoring/lemon/metric/srmerrors
#
############################################################
template monitoring/lemon/metric/srmerrors;
                  
"/system/monitoring/metric/_6512" = nlist(
        "name",         "SrmErrors",
        "descr",        "Check for Errors in Srm logfile",
        "class",        "log.Parse",
        "param",        list("logfile", "/usr/spool/srm/srm.log",
			     "dformat", "%b %d %H:%M:%S",
			     "istring", "(failed|Timed out)",
                             "sincelast", "1h",
                             "rolledlogs", "yes"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);