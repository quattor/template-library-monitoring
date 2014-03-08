template monitoring/lemon/exception/snmpd;


"/system/monitoring/exception/_30031" = nlist(
        "name",      	"snmpd_wrong",
        "descr",     	"Snmp daemon wrong",
        "active",    	true,
        "latestonly",	false,
        "importance", 	2,
    	"alarmtext", 	"snmpd_wrong",
	"correlation",	"4001:1 < 1",
   	"actuator", 	nlist("execve",  "/sbin/service snmpd start",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  false)
);

