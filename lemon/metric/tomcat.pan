############################################################
#
# template monitoring/lemon/metric/tomcat
#
############################################################

template monitoring/lemon/metric/tomcat;

"/system/monitoring/metric/_40" = nlist(
	"name",      	"tomcat",
	"descr",     	"tomcat running processes",
	"class",     	"system.numberOfProcesses",
        "param",     	list("name", "java", "uid", "91", "ppid", "1"),
	"period",    	120,
        "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);