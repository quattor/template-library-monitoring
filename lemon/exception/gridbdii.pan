template monitoring/lemon/exception/gridbdii;


"/system/monitoring/exception/_30248" = nlist(
	"name",         "bdiistatus",
	"descr",        "BDII not responding",
	"active",       true,
	"latestonly",   true,
	"importance",   2,
	"correlation",  "20048:1 != 0"
);

"/system/monitoring/exception/_30250" = nlist(
        "name",         "bdiislapd",
        "descr",        "BDII slapd bad number of process",
        "active",       true,
        "latestonly",   true,
        "importance",   2,
        "correlation",  "20050:1 != 2"
);




# End-of-File
