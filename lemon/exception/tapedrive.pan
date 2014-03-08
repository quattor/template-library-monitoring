template monitoring/lemon/exception/tapedrive;


"/system/monitoring/exception/_30354" = nlist(
	"name",      	"nvc_wrong",
	"descr",     	"nvc bit setting wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
  	"alarmtext", 	"nvc_wrong",
	"correlation",	"6605:1 < 0",
	"actuator", 	nlist("execve",  "/usr/sbin/toggleTapeDrive nvc /dev/nst0",
			      "maxruns", 1,
			      "timeout", 0,
			      "active",  true)
);


"/system/monitoring/exception/_30355" = nlist(
    "name",         "leot_wrong",
    "descr",        "leot bit setting wrong",
    "active",       true,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "leot_wrong",
    "correlation",  "6606:1 < 0",
    "actuator",     nlist("execve",  "/usr/sbin/toggleTapeDrive leot /dev/nst0",
                  "maxruns", 1,
                  "timeout", 0,
                  "active",  true)
);


