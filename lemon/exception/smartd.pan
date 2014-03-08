template monitoring/lemon/exception/smartd;


"/system/monitoring/exception/_30056" = nlist(
        "name",         "smartd_wrong",
        "descr",        "SMART daemon wrong",
        "active",       true,
        "latestonly",   false,
        "importance",   3,
         "minoccurs",    2,
	"correlation",	"4022:1 < 1"
);

