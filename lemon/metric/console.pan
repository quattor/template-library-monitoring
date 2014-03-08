############################################################
#
# template monitoring/lemon/metric/console
#
############################################################

template monitoring/lemon/metric/console;

"/system/monitoring/metric/_5128" = nlist(
	"name",      	"SerialCardError",
	"descr",     	"Are there serial card errors reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring","consoled: \\(error\\) tcgetattr:", "sinceboot","yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5129" = nlist(
	"name",      	"consoled",
	"descr",     	"the \"consoled\" daemon",
	"class",     	"system.numberOfProcesses",
   	"param",     	list("name", "consoled", "ucp", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_9513" = nlist(
	"name",      	"ConsoleAccess",
	"descr",     	"Monitor health of the console service",
	"class",     	"console.ConsoleAccess",
	"period",    	600,
    	"smooth",    	nlist("typeString", true, "maxdiff", 0.0, "maxtime", 6000),
	"active",    	true,
	"latestonly",	false,
);
