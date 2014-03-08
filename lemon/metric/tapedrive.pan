############################################################
#
# template monitoring/lemon/metric/tapedrive
#
############################################################

template monitoring/lemon/metric/tapedrive;

"/system/monitoring/metric/_6605" = nlist(
	"name",      	"nvc",
	"descr",     	"nvc bit setting",
	"class",     	"tapedrive.NVC",
    "param",     	list("nvc", "on", "device", "/dev/nst0"),
   	"period",    	2400,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);
                                                                                                                                                          
"/system/monitoring/metric/_6606" = nlist(
    "name",         "leot",
    "descr",        "leot bit setting",
    "class",        "tapedrive.LEOT",
    "param",        list("leot", "on", "device", "/dev/nst0"),
    "period",       2400,
    "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
    "active",       true,
    "latestonly",   false,
);