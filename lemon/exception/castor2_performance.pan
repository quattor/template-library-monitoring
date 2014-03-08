template monitoring/lemon/exception/castor2_performance;


"/system/monitoring/exception/_30360" = nlist(
        "name",         "mighunter_problem",
        "descr",        "Wrong number of MigHunters running",
        "active",       false,
        "latestonly",   true,
        "importance",   1,
        "alarmtext",   "mighunter_problem",
        "correlation", "6523:0 <= 0",
        "actuator",     nlist("execve",  "/sbin/service MigHunter restart",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true),
);






"/system/monitoring/exception/_30362" = nlist(
	"name",         "subrequest_meltdown", 
        "descr",        "Subrequest table has too many entries", 
        "active",       false, 
        "latestonly",   true, 
        "importance",   1, 
        "alarmtext",   "subrequest_problem", 
        "correlation", "6276:0:* > 1500000"
);




"/system/monitoring/exception/_33051"=nlist( 
     "name",         "queue_large", 
     "descr",        "LSF Queue large", 
     "active",       false, 
     "period",       600,
     "latestonly",   false,
     "importance",   1, 
     "minoccurs",   3,
     "local",      true,
     "alarmtext",   "LSF_QUEUE_LARGE", 
     "correlation", "(*:6259:2  > 500) && (*:6259:2 <= 800)",
     "actuator",     nlist(
                           "execve",  "/bin/sh -c \\\\\" /bin/echo 'LSF Queue Large - over 500 requests' | /bin/mail -s \\\\\\\"Large LSF Pending Queue on $HOSTNAME\\\\\\\"  castor-monitoring@cern.ch \\\\\" ", 
                           "maxruns", 1,
			   "window", 1800, 
                           "timeout", 0, 
                           "active",  true),
); 


"/system/monitoring/exception/_33052"=nlist( 
     "name",        "queue_meltdown", 
     "descr",       "LSF Queue Meltdown", 
     "active",      false, 
     "period",      600,
     "latestonly",  false,
     "importance",  1, 
     "minoccurs",   3,
     "local",      true,
     "alarmtext",   "LSF_QUEUE_MELTDOWN", 
     "correlation", "*:6259:2 > 800",
     "actuator",    nlist( 
                          "execve",  "/bin/sh -c \\\\\" /bin/echo 'LSF Queue Large - over 800 requests' | /bin/mail -s \\\\\\\"LSF Queue Meltdown on $HOSTNAME\\\\\\\" castor-monitoring@cern.ch \\\\\" ", 
                          "maxruns", 1, 
                          "timeout", 0, 
                          "active",  true,
			  "window", 1800) 
); 





