############################################################
#
# template monitoring/lemon/metric/blparserlsf
#
############################################################

template monitoring/lemon/metric/blparserlsf;

"/system/monitoring/metric/_4024" = nlist(
	"name",      	"BLParserLSF",
        "descr",     	"GLite LSF log file parser",
        "class",     	"system.numberOfProcesses", 
        "param",     	list("name","blparserlsf","uid","0"),
        "period",   	60, 
        "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",    	false,
        "latestonly",	false,
);