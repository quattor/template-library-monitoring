############################################################
#
# template monitoring/lemon/metric/quattor
#
############################################################

template monitoring/lemon/metric/quattor;

"/system/monitoring/metric/_4113" = nlist(
	"name",      	"SpmaError",
	"descr",     	"Check for errors/warning SPMA log files",
	"class",     	"FIO::SpmaError",
	"period",    	1800,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5014" = nlist(
	"name",      	"nospma.size",
	"descr",     	"size of file \"/etc/nospma\"",
	"class",     	"file.size",
    	"param",     	list("file", "/etc/nospma"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff",  0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5120" = nlist(
	"name",      	"notd",
	"descr",     	"the \"notd\" notification daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "notd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);"/system/monitoring/metric/_5123" = nlist(
	"name",      	"cdp-listend",
	"descr",     	"quattor CCM synchronization daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "cdp-listend", "uid", "0", "ppid", "1"),
	"period",    	600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);"/system/monitoring/metric/_5124" = nlist(
	"name",      	"ncm-cdispd",
	"descr",     	"quattor NCM cdispd autoreconfig daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "ncm-cdispd", "uid", "0", "ppid", "1"),
	"period",    	600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);