############################################################
#
# template monitoring/lemon/metric/sendmail
#
############################################################

template monitoring/lemon/metric/sendmail;

"/system/monitoring/metric/_4012" = nlist(
	"name",      	"sendmail",
	"descr",     	"\"sendmail\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "sendmail", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);