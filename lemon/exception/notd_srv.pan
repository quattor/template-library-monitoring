template monitoring/lemon/exception/notd_srv;


"/system/monitoring/exception/_30085" = nlist(
	"name",         "notd_srv_wrong",
	"descr",        "notd_srv daemon wrong",
	"active",       true,
	"latestonly",   false,
	"importance",   3,
	"alarmtext",  	"notd_srv_wrong",
	"correlation", 	"5119:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service notd_srv restart",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);

