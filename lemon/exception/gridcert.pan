template monitoring/lemon/exception/gridcert;


"/system/monitoring/exception/_30607" = nlist(
    "name",         "Certificate Wrong",
    "descr",        "Grid Host Certificate missing or about to expire",
    "active",       false,
    "latestonly",   false,
    "importance",   1,
	"alarmtext",    "grid-host-certificate-expiring",
	"correlation",  "810:1 < 1",
);


