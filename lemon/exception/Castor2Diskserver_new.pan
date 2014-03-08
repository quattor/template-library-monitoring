template monitoring/lemon/exception/Castor2Diskserver_new;



"/system/monitoring/exception/_30340" = nlist(
	"name",		"rmnode_status_wrong",
	"descr",	"",
	"active",       false,
        "latestonly",   false,
        "importance",   1,
	"local",	true,
        #"alarmtext",    "",
        "correlation",  "((6261:1 eq 'PRODUCTION') && (6262:1 ne 'PRODUCTION')) || ((6261:1 eq 'STANDBY') && (6262:1 ne 'DRAINING')) || ((6261:1 eq 'MAINTENANCE') && (6262:1 ne 'DISABLED'))",
	"actuator",     nlist("execve",  "/usr/bin/Castor2DiskserverActuator.py",
                              "maxruns", 3,
                              "timeout", 60,
                              "active",  true)
);


"/system/monitoring/exception/_30342" = nlist(
        "name",         "castor_partition_full",
        "descr",        "castor utilization exceeds limis",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
	"local",	true,
        #"alarmtext",    "castor_partition_full",
        "correlation",  "((9104:1 regex '/srv/castor') && (9104:5 > 99))",
        "actuator",     nlist("execve",  "/usr/bin/send_mail.py --from castorc3@mail.cern.ch --to castorc3@mail.cern.ch --subject data_fs_full --message localhost has castor full filesystems.",
                              "maxruns", 1,
			      "window",  43200,
                              "timeout", 120,
                              "active",  true)
);


