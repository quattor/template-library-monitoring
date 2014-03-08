template monitoring/lemon/exception/afs;


"/system/monitoring/exception/_30020"=nlist(
	"name",      	"afsd_wrong",
	"descr",     	"afs daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"afsd_wrong",
        "correlation", 	"46:1 !range '1-20'",
	"actuator", 	nlist("execve",  "/sbin/service afs restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);




"/system/monitoring/exception/_30086"=nlist(
	"name",      	"afs_cache_corrupted",
	"descr",     	"afs cache corrupted",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
        "correlation", 	"910:1 != 0",
	"local",	true,
	"actuator", 	nlist("execve",  "/bin/sh -c \\\\\" /bin/echo 'AFS cache problem detected by Lemon. Please check. ' | /bin/mail -s \\\\\\\"AFS cache alarm on $HOSTNAME\\\\\\\" Rainer.Toebbicke@cern.ch \\\\\" ",
			      "maxruns", 1,
			      "timeout", 0,
			      "active",  true)
);





 "/system/monitoring/exception/_30064" = nlist(
         "name",         "afslostandfound",
         "descr",        "AFS lost+found files found",
         "active",       true,
         "latestonly",   false,
         "importance",   1,
         "alarmtext",    "AfsLostAndFound",
         "correlation",  "((911:1 > 0) && (911:1 != -1))",
         "actuator",     nlist("execve","/bin/sh -c \\\\\"/bin/rm -Rf /usr/vice/cache/lost+found/* \\\\\" ","maxruns", 1,                                                                                                                                                    "timeout", 0,                                                                                                                                                    "active",  true)
);


