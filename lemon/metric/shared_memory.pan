############################################################
#
# template monitoring/lemon/metric/shared_memory
#
############################################################

template monitoring/lemon/metric/shared_memory;

"/system/monitoring/metric/_4102" = nlist(
	"name",      	"SharedMemory",
	"descr",     	"the size of the shared memory",
	"class",     	"system.memoryShared",
	"period",   	86400,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);