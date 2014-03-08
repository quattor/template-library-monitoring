template monitoring/lemon/exception/rpmverify;


"/system/monitoring/exception/_32003" = nlist(
	"name",          "rpmverify_no_run",
	"descr",         "RPM verify did not run in last 24h",
	"active",        true,
	"latestonly",    false,
	"importance",    2,
       	"reftime",       "07:01",
    	"alarmtext", 	"rpmverify-status",
	"correlation",	"5035:1 < 2 && 9001:1 > 86400"
);




"/system/monitoring/exception/_32002" = nlist(
	"name",         "rpmverify_positive",
	"descr",        "RPM verify positive find",
	"active",       true,
	"latestonly",   false,
	"importance",   2,
    	"alarmtext", 	"rpmverify-issue",
	"correlation",	"5036:1 > 0 && 9001:1 > 3600"
);




