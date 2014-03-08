############################################################
#
# template pro_monitoring_error_trending
#
############################################################

template monitoring/lemon/metric/error_trending;

"/system/monitoring/metric/_12001" = nlist(
	"name",      	"error_trending",
	"descr",     	"number of errors per group per week",
	"class",     	"cluster_failures",
	"period",    	604800,
	"active",    	true,
	"latestonly",	false,
);

