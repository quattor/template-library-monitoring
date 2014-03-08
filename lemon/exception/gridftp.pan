template monitoring/lemon/exception/gridftp;

"/system/monitoring/exception/_30054" = nlist(
    	"name",         "lcg-mon-gridftp",
    	"descr",        "lcg-mon-gridftp daemon wrong",
    	"active",       value("/system/monitoring/metric/_" + refmetric + "/active"),
    	"latestonly",   false,
    	"importance",   2,
    	"alarmtext", 	"GRIDFTP_LCGMON_WRONG",
    	"correlation", 	refmetric + ":1 != 1",
        "actuator",     nlist("execve",  "/sbin/service lcg-mon-gridftp restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30107" = nlist(
        "name",         "Gridview-Gridftp-Publisher",
        "descr",        "Gridview-Gridftp-Publisher daemon wrong",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "GRIDVIEW_GRIDFTP_WRONG",
        "correlation",  "27:1 != 1",
        "actuator",     nlist("execve",  "/sbin/service gridview-gridftp-wsclient restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);



"/system/monitoring/exception/_30063" = nlist(
    	"name",         "gridftp_wrong",
    	"descr",        "Gridftp daemon wrong",
    	"active",       value("/system/monitoring/metric/_" + refmetric + "/active"),
    	"latestonly",   false,
    	"importance",   1,
    	"alarmtext", 	"gridftp_wrong",
        "correlation",	refmetric + ":1 < 1",
        "actuator",     nlist("execve",  "/sbin/service castor-gridftp restart",
                              "maxruns", 3,
                              "timeout", 300,
                              "active",  false)
);


