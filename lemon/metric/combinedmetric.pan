############################################################
#
# template monitoring/lemon/metric/combinedmetric
#
############################################################

template monitoring/lemon/metric/combinedmetric;

"/system/monitoring/metric/_7001" = nlist(
	"name",      	"CM.loadAvg",
	"descr",     	"returns the loadAvg of a pre-defined cluster",
	"class",     	"CM.loadAvg",
	"period",    	600,
	"active",   	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_7002" = nlist(
	"name",      	"CM.userAvg",
	"descr",     	"returns the average number of users within a pre-defined cluster",
	"class",     	"CM.userAvg",
	"period",    	600, 
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_7003" = nlist(
	"name",      	"CM.aliveNodes",
	"descr",     	"returns the number of alive nodes within a pre-defined cluster",
	"class",     	"CM.aliveNodes",
	"period",    	600, 
	"active",    	true,
	"latestonly",	false,
);

