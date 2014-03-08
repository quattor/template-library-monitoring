############################################################
#
# template monitoring/lemon/metric/lpd
#
############################################################

template monitoring/lemon/metric/lpd;

"/system/monitoring/metric/_50" = nlist(
	"name",	      	"lpd",
	"descr",      	"\"lpd\" Line Printer daemon",
	"class",      	"system.numberOfProcesses",
	"param",      	list("name", "lpd", "ppid", "1"),
	"period",     	60,
	"smooth",     	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",     	true,
	"latestonly", 	false,
);"/system/monitoring/metric/_53" = nlist(
	"name",		"lpd_md5",
	"descr",	"\"lpd\" File print check",
	"class", 	"file.md5sum",
	"param",	list("file", "/tmp/lpmon"),
	"period",	300,
	"offset",	"500",
	"active",	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_52" = nlist(
	"name",		"lpd_age",
	"descr",	"\"lpd\" test file age",
	"class",	"file.sslmtime",
	"param",	list("file", "/tmp/lpmon"),
	"period",	300,
	"offset",	"510",
	"active",	true,
	"latestonly",	false,
);