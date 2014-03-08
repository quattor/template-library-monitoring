template monitoring/lemon/exception/cvsservice;


"/system/monitoring/exception/_33001" = nlist(
	"name",        	"cvs_ssh_availability",
	"descr",       	"Not all projects are available via ssh",
	"active",      	false,
	"latestonly",  	false,
	"importance",  	1,
	"correlation",  "*:9502:1 < 100"
);


"/system/monitoring/exception/_33002" = nlist(
	"name",       	"cvs_kserver_availability",
	"descr",       	"Not all projects are available via kserver",
	"active",      	false,
	"latestonly",  	false,
	"importance",  	1,
	"correlation",  "*:9502:2 < 100"
);



"/system/monitoring/exception/_33003" = nlist(
	"name",        	"cvs_pserver_Availability",
	"descr",       	"Not all projects are available via pserver",
	"active",      	false,
	"latestonly",  	false,
	"importance",  	1,
	"correlation",  "*:9502:3 < 100"
);



"/system/monitoring/exception/_33004" = nlist(
	"name",        	"cvs_slow_performance",
	"descr",       	"Slow cvs checkouts",
	"active",      	false,
	"latestonly",  	false,
	"importance",  	1,
	"correlation",  "(*:9503:1 < 0) || (*:9503:1 > 20)"
);

