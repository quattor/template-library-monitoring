############################################################
#
# template monitoring/lemon/metric/gridpx
#
############################################################

template monitoring/lemon/metric/gridpx;

"/system/monitoring/metric/_803" = nlist(
	"name",      	"PxStatus",
	"descr",     	"returns <0 if MyProxy down, >=0 if MyProxy up",
	"class",     	"GridPx::PxStatus",
	"period",    	120,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_804" = nlist(
        "name",      	"PxLoad",
        "descr",     	"Returns a value for the current load on the MyProxy",
        "class",     	"GridPx::PxLoad",
        "period",    	120,
        "active",    	false,
        "latestonly",	false,
);