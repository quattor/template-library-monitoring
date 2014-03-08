template monitoring/lemon/exception/quattor;


"/system/monitoring/exception/_30016" = nlist(
	"name",      	"spma_error",
	"descr",     	"Check for errors/warning in SPMA log files",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"Spma_Error",
	"correlation",	"4113:1 != 0",
	"actuator", 	nlist("execve",  "/usr/sbin/spma_wrapper.sh",
			      "maxruns", 1,
			      "timeout", 0,
			      "active",  true)
);




"/system/monitoring/exception/_30069" = nlist(
	"name",      	"nospma_present",
	"descr",     	"/etc/nospma file present",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"5014:1 != -1",
);





"/system/monitoring/exception/_30048" = nlist(
	"name",      	"notd_wrong",
	"descr",     	"Not daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"notd_wrong",
	"correlation",	"5120:1 !range '1-2'",
	"actuator", 	nlist("execve",  "/sbin/service notd start",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);





"/system/monitoring/exception/_30067" = nlist(
	"name",      	"cdp_listend_wrong",
	"descr",     	"cdp-listend daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"silent",	true,
	"correlation",	"5123:1 !range '1-2'",
	"actuator", 	nlist("execve",  "/sbin/service cdp-listend start",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);





"/system/monitoring/exception/_30068" = nlist(
	"name",      	"ncm_cdispd_wrong",
	"descr",     	"ncm_cdispd daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"silent",	false,
	"correlation",	"5124:1 !range '1-2'",
        "minoccurs",    4,
	"actuator", 	nlist("execve",  "/sbin/service ncm-cdispd start",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);



