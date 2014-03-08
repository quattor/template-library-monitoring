############################################################
#
# template monitoring/lemon/metric/os
#
############################################################

template monitoring/lemon/metric/os;

"/system/monitoring/metric/_4109" = nlist(
	"name",	    	"OS",
	"descr",     	"returns name, release and version of the operating system",
	"class",     	"system.Os",
 	"period",    	0,
    	"smooth",    	nlist("typeString", true, "maxtime", 0),
	"active",    	true,
	"latestonly",	false,
);