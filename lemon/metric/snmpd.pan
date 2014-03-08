############################################################
#
# template monitoring/lemon/metric/snmpd
#
############################################################

template monitoring/lemon/metric/snmpd;

"/system/monitoring/metric/_4001" = nlist(
	"name",      	"snmpd",
	"descr",     	"\"snmpd\" SNMP daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "snmpd", "uid", "0"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);