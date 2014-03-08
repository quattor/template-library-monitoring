############################################################
#
# template monitoring/lemon/metric/extranwifaces
#
############################################################

template monitoring/lemon/metric/extranwifaces;


"/system/monitoring/metric/_9204" = nlist(
	"name",      	"networkIO_eth1",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: \"eth1\")",
	"class",     	"system.networkIO",
    	"param",     	list("interface","eth1"),
	"period",    	300,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_9205" = nlist(
	"name",      	"networkIO_eth2",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: \"eth2\")",
	"class",     	"system.networkIO",
    	"param",     	list("interface","eth2"),
	"period",    	300,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_9206" = nlist(
	"name",      	"networkIO_eth3",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: \"eth3\")",
	"class",     	"system.networkIO",
    	"param",     	list("interface","eth3"),
	"period",    	300,
	"active",    	false,
	"latestonly",	false,
);
"/system/monitoring/metric/_9207" = nlist(
	"name",      	"networkIO_eth4",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: \"eth4\")",
	"class",     	"system.networkIO",
    	"param",     	list("interface","eth4"),
	"period",    	300,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_9301" = nlist(
	"name",      	"networkIO_myri0",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: \"myri0\")",
	"class",     	"system.networkIO",
    	"param",     	list("interface","myri0"),
	"period",   	300,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_9311" = nlist(
	"name",      	"networkIO_ipoib0",
	"descr",     	"number of kilobytes read and write (total since boot time and average per second over last interval) on the given interface (parameter interface: ipoib0)",
	"class",     	"system.networkIO",
   	"param",     	list("interface","ipoib0"),
	"period",    	300,
	"active",    	false,
	"latestonly",	false,
);
