#
# template monitoring/lemon/metric/notd_srv
#

template monitoring/lemon/metric/notd_srv;

"/system/monitoring/metric/_5119" = nlist(
	"name",	      	"notd_srv",
	"descr",       	"notd_srv daemon",
	"class",      	"system.numberOfProcesses",
	"param",      	list("name", "notd_srv", "uid", "0"),
	"period",     	60,
	"smooth",     	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",     	true,
	"latestonly", 	true,
);