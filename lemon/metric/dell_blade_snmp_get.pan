#
# SNMP heartbeat monitoring of DELL blade.  Check the 
# value returned for number of interfaces since this is a regular value
#
# 6335	    Heartbeat
#
template monitoring/lemon/metric/dell_blade_snmp_get;

"/system/monitoring/metric/_6335" = nlist(
"name",  "snmpHeartbeat",
"descr", "Monitor SNMP status",
"class", "snmpget.getint",
"param", list("host","lxbladedell","oid",".1.3.6.1.2.1.2.2.1.1.1","community","/etc/snmpget.conf"),
"period", 300,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);
