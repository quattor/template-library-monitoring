############################################################
#
# template monitoring/lemon/metric/snmptrap
#
############################################################

template monitoring/lemon/metric/snmptrap;

#
# Generic SNMP trap handling
#

# INFO

"/system/monitoring/metric/_9506" = nlist(
        "name",        "SnmpInfoTrap",
        "descr",       "Received SNMP trap with severity INFO",
        "class",       "log.Parse",
        "period",      300,
        "smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",      true,
        "latestonly",  true,
        "param", list(
                "istring",   "SEVERITY: '.+' INFO",
                "onbehalf", "ON_BEHALF:\\s+(\\S+)",
                "sincelast", "20m"),
);# WARNING

"/system/monitoring/metric/_9505" = nlist(
        "name",        "SnmpWarningTrap",
        "descr",       "Received SNMP trap with severity WARNING",
        "class",       "log.Parse",
        "period",      300,
        "smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",      true,
        "latestonly",  true,
        "param", list(
                "istring",   "SEVERITY: '.+' WARNING",
                "onbehalf", "ON_BEHALF:\\s+(\\S+)",
                "sincelast", "20m"),
);# CRITICAL

"/system/monitoring/metric/_9504" = nlist(
        "name",        "SnmpCriticalTrap",
        "descr",       "Received SNMP trap with severity CRITICAL",
        "class",       "log.Parse",
        "period",      300,
        "smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",      true,
        "latestonly",  true,
        "param", list(
                "istring",   "SEVERITY: '.+' CRITICAL",
                "onbehalf", "ON_BEHALF:\\s+(\\S+)",
                "sincelast", "20m"),
);#
# Older SNMP trap handling for STK Powerhorns
#
#"/system/monitoring/metric/_6312" = nlist(
#    	"name",      	"snmpTrap.pipe",
#    	"descr",    	"link between edg-fmon-agent and snmp-trap-sensor",
#    	"class",     	"file.dump",
#     	"param",     	list("file", "/var/run/snmpTrap.pipe",
#                       		"multitype","1"),
#    	"period",    	0,
#    	"active",    	true,
#    	"latestonly",	true,
#);
#
#"/system/monitoring/metric/_6313" = nlist(
#    	"name",      	"acsTrpAcsState",
#    	"descr",     	"returns ACLS ACS State Information",
#    	"class",     	"acsTrpAcsState",
#    	"period",    	0, # never previously defined 
#    	"active",   	true,
#    	"latestonly",	false,
#);
#
#"/system/monitoring/metric/_6314" = nlist(
#    	"name",      	"acsTrpLsmState",
#    	"descr",     	"returns ACLS LSM State Information",
#    	"class",     	"acsTrpLsmState",
#    	"period",    	0, # never previously defined
#    	"active",    	true,
#    	"latestonly",	false,
#);
#
#"/system/monitoring/metric/_6315" = nlist(
#    	"name",      	"acsTrpDriveState",
#    	"descr",     	"returns ACLS Drive State Information",
#    	"class",     	"acsTrpDriveState",
#    	"period",    	0, # never previously defined
#    	"active",    	true,
#    	"latestonly",	false,
#);
#
#"/system/monitoring/metric/_6316" = nlist(
#    	"name",      	"acsTrpCapState",
#    	"descr",     	"returns ACLS CAP State Information",
#    	"class",     	"acsTrpCapState",
#    	"period",    	0, # never previously defined
#    	"active",    	true,
#    	"latestonly",	false,
#);
#
#"/system/monitoring/metric/_6317" = nlist(
#    	"name",      	"acsTrpInfo",
#    	"descr",     	"returns ACLS Information",
#    	"class",     	"acsTrpInfo",
#    	"period",    	0, # never previously defined
#    	"active",    	true,
#    	"latestonly",	false,
#);
