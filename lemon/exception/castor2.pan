template monitoring/lemon/exception/castor2;


"/system/monitoring/exception/_30330" = nlist(
	"name",      	"stager_wrong",
	"descr",     	"Castor2 stager daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"stager_wrong",
	"correlation",	"6501:1 < 1"
);




"/system/monitoring/exception/_30329" = nlist(
	"name",      	"rmMasterDaemon_wrong",
	"descr",     	"Castor2 rmMasterDaemon daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"rmMasterDaemon_wrong",
    #"local",        true, # no operator alarms for now....
	"correlation",	"6502:1 < 1",
    "actuator",     nlist("execve",  "/sbin/service rmMasterDaemon restart", "maxruns", 10, "timeout", 0,  "active",  true),
);




"/system/monitoring/exception/_30324" = nlist(
	"name",         "dlfserver_wrong",
	"descr",        "dlfserver daemon wrong",
	"active",       false,
	"latestonly",   false,
	"importance",	3,
	"alarmtext",    "dlfserver_wrong",
	"correlation",  "6503:1 < 1",
	"actuator",     nlist("execve",  "/sbin/service dlfserver start",
                          "maxruns", 3,
                          "timeout", 0,
                          "active",  false)
);




"/system/monitoring/exception/_30331" = nlist(
	"name",      	"rtcpclientd_wrong",
	"descr",     	"Castor2 rtcpclientd daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"rtcpclientd_wrong",
	"correlation",	"6504:1 < 1"
);




"/system/monitoring/exception/_30332" = nlist(
	"name",      	"rhserver_wrong",
	"descr",     	"Castor2 rhserver daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"rhserver_wrong",
	"correlation",	"6505:1 < 1"
);




"/system/monitoring/exception/_30333" = nlist(
	"name",      	"expertd_wrong",
	"descr",     	"Castor2 expertd daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"expertd_wrong",
	"correlation",	"6506:1 < 1",
);




"/system/monitoring/exception/_30334" = nlist(
	"name",      	"rmNodeDaemon_wrong",
	"descr",     	"Castor2 rmnode daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"rmNodeDaemon_wrong",
	"correlation",	"6507:1 < 1"
);




"/system/monitoring/exception/_30335" = nlist(
	"name",      	"srm_wrong",
	"descr",     	"Castor2 srm daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"srm_wrong",
	"correlation",	"6508:1 < 1"
);




"/system/monitoring/exception/_30336" = nlist(
	"name",      	"Castor2_lsf_plugin_wrong",
	"descr",     	"Castor2 lsf plugin wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"Castor2_plugin_wrong",
	"correlation",	"6509:1 > 0"
);




"/system/monitoring/exception/_30337" = nlist(
	"name",      	"gcDaemon",
	"descr",     	"Castor2 gcDaemon daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"gcDaemon_wrong",
	"correlation",	"6510:1 < 1"
);




"/system/monitoring/exception/_30325" = nlist(
        "name",      	"srm_stuck",
        "descr",     	"SRM processes piling up",
        "active",    	false,
        "latestonly",	false,
        "importance", 	2,
        "alarmtext", 	"srm_stuck",
        "correlation",  "(6511:1 > 800 && 30325:1 = 0) || (6511:1 > 600 && 30325:1 = 1)"
);




"/system/monitoring/exception/_30328" = nlist(
        "name",         "DLF_FULL",
        "descr",        "DLF is full",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "dlf_full",
        "correlation",  "6514:1 > 0"
);




"/system/monitoring/exception/_30327" = nlist(
        "name",         "stgdb_mem_error",
        "descr",        "stager database has a memory problem",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "stgdb_mem_error",
        "correlation",  "6513:1 > 0"
);




"/system/monitoring/exception/_30341" = nlist(
        "name",         "cleaning_daemon_wrong",
        "descr",        "Castor2 cleaning daemon wrong",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "cleaning_daemon_wrong",
        "correlation",  "6263:1 < 1"
);





"/system/monitoring/exception/_30076" = nlist(
	"name",         "scheduler_error",
	"descr",        "check for fatal errors in scheduler DLF logfile",
	"active",       false,
	"latestonly",   false,
	"importance",	3,
	"alarmtext",    "scheduler_error",
	"correlation",  "6515:1 > 0",
	"actuator",     nlist("execve",  "/bin/sh -c \\\\\"/sbin/service lsf stop; /usr/bin/killall mbschd; /bin/sleep 5; /sbin/service lsf start \\\\\"",
                          "maxruns", 10,
                          "timeout", 0,
                          "active",  true)
);




"/system/monitoring/exception/_30326" = nlist(
        "name",         "srmDaemon_wrong",
        "descr",        "Castor SRM v22 daemon process wrong",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "srmDaemon_wrong",
        "correlation",  "6516:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service srmDaemon restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30338" = nlist(
        "name",         "srmServer_wrong",
        "descr",        "Castor SRM v22 Server process wrong",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "srmServer_wrong",
        "correlation",  "6517:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service srmServer restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30343" = nlist(
        "name",         "srmServer_gss_error",
        "descr",        "GSS errors detected for Castor SRM v22 Server process",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "srmServer_gss_error",
        "correlation",  "6518:1 > 0",
        "actuator",     nlist("execve",  "/sbin/service srmServer restart",
                              "maxruns", 0,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30344" = nlist(
        "name",         "srmDaemon_stale",
        "descr",        "No activity detected on Castor SRM v22 Daemon process",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "srmDaemon_stale",
        "correlation",  "6519:1 > 120",
	"local",	true,
        "actuator",     nlist("execve",  "/sbin/service srmDaemon restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30345" = nlist(
        "name",         "srmServer_dberror",
        "descr",        "Database connectivity error detected for srmServer",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "srmServer_dberror",
        "correlation",  "6519:1 > 0",
        "actuator",     nlist("execve",  "/sbin/service srmServer restart",
                              "maxruns", 0,
                              "timeout", 0,
                              "active",  true)
);


 

"/system/monitoring/exception/_30346" = nlist(
	"name", 	"too_many_fds",
	"descr", 	"Castor2 stager daemon wrong",
	"active", 	false,
	"latestonly", 	false,
	"importance", 	1,
	"alarmtext", 	"too_many_fds",
	"correlation", 	"6521:1 > 800",
	"silent", 	true,
); 




"/system/monitoring/exception/_30347" = nlist(
	"name",         "scheduler_noOCI",
	"descr",        "lost connection to oracle",
	"active",       false,
	"latestonly",   false,
	"importance",	3,
	"alarmtext",    "scheduler_noOCI",
	"correlation",  "6524:1 > 0",
	"actuator",     nlist("execve",  "/bin/sh -c \\\\\"/sbin/service lsf stop; /usr/bin/killall -9 mbschd; /usr/bin/killall -9 mbatchd; /bin/sleep 5; /sbin/service lsf start \\\\\"",
                          "maxruns", 10,
                          "timeout", 0,
                          "active",  true)
);




"/system/monitoring/exception/_30348" = nlist(
        "name",         "c2lsf_daemons_wrong",
        "descr",        "Not all LSF-related processes are running",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "c2lsf_daemons_wrong",
        "correlation",  "6525:1 < 7", 
        #"correlation",  "6525:1 != 9",
        #"local",        true, # no operator alarms for now....
        "actuator",     nlist("execve",  "/bin/sh -c \\\\\"/bin/ps | grep lsf; /sbin/service lsf stop; /bin/sleep 5; /usr/bin/killall lim res sbatchd mbatchd mbschd pem vemkd pim; /bin/sleep 5; /sbin/service lsf start; /bin/sleep 300 \\\\\"",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30361" = nlist(
	"name",         "GdFTPisCASTOR1",
	"descr",        "Grid ftp server is trying to connect using CASTOR1 protocol",
	"active",       false,
	"latestonly",   false,
	"importance",	2,
	"alarmtext",    "GdFTPisCASTOR1",
	"correlation",  "6530:1 > 0",
);




"/system/monitoring/exception/_30363" = nlist(
        "name",         "jobmanager_wrong",
        "descr",        "Castor2 jobManager daemon wrong",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "jobManager_wrong",
        "correlation",  "6531:1 < 1"
);




"/system/monitoring/exception/_30364" = nlist(
        "name",         "many_missing_heartbeat",
        "descr",        "rmMasterDaemon is reporting too many missing heart beats",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "many_missing_heartbeat",
        "correlation",  "6277:1 > 8",
        "actuator",     nlist("execve",  "/bin/sh -c \\\\\"/sbin/service rmMasterDaemon restart; /bin/echo 'Too many missing heart beats triggered an rmMasterDaemon restart.' | /bin/mail -s \\\\\\\"rmMasterDaemon restarted\\\\\\\" castor-deployment@cern.ch \\\\\" " ,
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)

);


