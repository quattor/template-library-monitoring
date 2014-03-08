############################################################
#
# template monitoring/lemon/metric/sindes
#
############################################################

template monitoring/lemon/metric/sindes;

"/system/monitoring/metric/_5105" = nlist(
    "name",       "SINDES_client_cert_expired",
    "descr",      "Check if the SINDES client certificate has expired",
    "class",      "log.Parse",
    "param",      list("logfile",   "/var/log/sindes/sindes-renew.log",
                       "istring",   "Certificate expired",
                       "sincelast", "3h",
                       "dformat",   "[%Y-%m-%d %T]"),
    # sampling every 3 hours
    "period",     10800,
	# smoothing over 30 hours
    "smooth",     nlist("typeString", false, "maxdiff", 0.0, "maxtime", 108000),
    "active",     true,
    "latestonly", false
);