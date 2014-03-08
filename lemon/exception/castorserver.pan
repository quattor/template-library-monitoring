template monitoring/lemon/exception/castorserver;


"/system/monitoring/exception/_30312" = nlist(
	"name",         "nsdaemon_wrong",
	"descr",        "nsdaemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",   3,
    	"alarmtext", 	"nsdaemon_wrong",
	"correlation",	"6232:1 != 1",
);




"/system/monitoring/exception/_30314" = nlist(
	"name",         "vmgrdaemon_wrong",
	"descr",        "vmgrdaemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",   3,
    	"alarmtext", 	"vmgrdaemon_wrong",
	"correlation",  "6234:1 != 1",
);




"/system/monitoring/exception/_30315" = nlist(
	"name",         "cupvdaemon_wrong",
	"descr",        "Cupvdaemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",   3,
    	"alarmtext", 	"Cupvdaemon_wrong",
	"correlation",  "6235:1 != 1",
);


#"/system/monitoring/exception/_30316" = nlist(
#	"name",         "msgdaemon_wrong",
#	"descr",        "msgdaemon wrong",
#	"active",       false,
#	"latestonly",   false,
#	"importance",   3,
#    	"alarmtext", 	"msgdaemon_wrong",
#	"correlation",  "6236:1 != 1",
#);

"/system/monitoring/metric/_6237" = nlist(
	"name",      	"Cmonitd",
	"descr",     	"the Castor \"Cmonitd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",    	list("name", "Cmonitd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);


"/system/monitoring/exception/_30317" = nlist(
	"name",         "cmonitd_wrong",
	"descr",        "Cmonit daemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",   3,
    	"alarmtext", 	"Cmonitd_wrong",
	"correlation",  "6237:1 != 1",
);




"/system/monitoring/exception/_30311" = nlist(
	"name",         "vdqm_wrong",
	"descr",        "vdqm daemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",   3,
    	"alarmtext", 	"vdqm_wrong",
	"correlation",  "6238:1 != 1",
);

