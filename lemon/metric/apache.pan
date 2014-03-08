############################################################
#
# template monitoring/lemon/metric/apache
#
############################################################

template monitoring/lemon/metric/apache;

"/system/monitoring/metric/_4019" = nlist(
	"name",      	"httpd",
	"descr",     	"the Apache httpd daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "httpd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);