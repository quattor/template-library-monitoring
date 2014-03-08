#
# monitoring/metric/afspartitions
#
template monitoring/lemon/metric/afspartitions;

# metrics
"/system/monitoring/metric/_904/" = nlist(
    	"name", 	"partitions",
    	"descr", 	"AFS Partitions Statistics",
   	"class", 	"afspartitions.partitions",
    	"period", 	1200,
    	"active", 	true,
    	"latestonly",	false,
);
