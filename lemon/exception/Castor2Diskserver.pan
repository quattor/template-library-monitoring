template monitoring/lemon/exception/Castor2Diskserver;



"/system/monitoring/exception/_30340" = nlist(
	"name",		"rmnode_status_wrong",
	"descr",	"",
	"active",       false,
        "latestonly",   false,
        "importance",   1,
	"local",      	true, 
        #"alarmtext",    "",
        "correlation",  "((6261:1 eq 'PRODUCTION') && (6262:1 ne 'Idle')) || ((6261:1 eq 'STANDBY') && (6262:1 ne 'Draining')) || ((6261:1 eq 'MAINTENANCE') && (6262:1 ne 'Down'))",
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
	"local",      	true, 
        "importance",   2,
        #"alarmtext",    "castor_partition_full",
        "correlation",  "((9104:1 regex '/srv/castor') && (9104:5 > 89))",
        "actuator",     nlist("execve",  "/usr/bin/send_mail.py --from castorc3@mail.cern.ch --to mmarques@mail.cern.ch --subject data_fs_full --message localhost has castor full filesystems",
                              "maxruns", 1,
			      "window",  43200,
                              "timeout", 120,
                              "active",  true)
);


"/system/monitoring/exception/_30357" = nlist(
         "name",         "Should be in standby",
         "descr",        "Diskserver should be in standby (draining)", 
         "active",       false,
         "latestonly",   false,
         "local",        true,
         "importance",   2,
         "alarmtext",    "Should_Be_Standby", 
         "correlation",  "6261:1 ne 'STANDBY' && 30358:1 == 0 && 30342:1 == 1",
         "actuator",     nlist("execve", "/usr/bin/set_standby.sh",
                               "maxruns", 3,
                               "timeout", 0,
                               "active",  true) ); 

"/system/monitoring/exception/_30358" = nlist(
         "name",         "Should be in maintenance",
         "descr",        "Diskserver should be in maintenance (down)", 
         "active",       false,
         "latestonly",   false,
         "local",        true,
         "importance",   2,
         "alarmtext",    "Should_Be_Maintenance", 
         "correlation",  "6261:1 ne 'MAINTENANCE' && 30530:1 == 1", 
         "actuator",     nlist("execve","/usr/bin/set_maintenance.sh", 
                               "maxruns", 3,
                               "timeout", 0,
                               "active",  true) );


