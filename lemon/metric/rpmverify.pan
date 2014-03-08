############################################################
#
# template monitoring/lemon/metric/rpmverify
#
############################################################
template monitoring/lemon/metric/rpmverify;

"/system/monitoring/metric/_5035" = nlist(
	"name",      	"RpmVerify",
	"descr",     	"Rpm Verify running",
	"class",     	"log.Parse",
    	"param",    	list("istring", "RPMVERIFY (has started running|has finished running)",
		      	     "sincelast", "24h",
		      	     "rolledlogs", "yes"),
      	"reftime",   	"07:00",
    	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5036" = nlist(
	"name",      	"RpmVerifyIssues",
	"descr",     	"Rpm Verify Issues",
	"class",     	"log.Parse",
    	"param",     	list("istring", "RPMVERIFY",
		      	     "estring", "RPMVERIFY (has started running|has finished running)",
		      	     "sincelast", "1h",
		      	     "rolledlogs", "yes"),
    	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);