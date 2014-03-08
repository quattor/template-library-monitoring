#
# SNMP Monitoring of the itstor disk arrays from the console head
# node.  
#
# 6335	    Heartbeat
template monitoring/lemon/metric/infotrend_itstor_snmp_get;

"/system/monitoring/metric/_6335" = nlist(
"name",  "snmpHeartbeat",
"descr", "Monitor SNMP status",
"class", "snmpget.getint",
"param", list("host","","oid",".1.3.6.1.4.1.1714.1.1.1.5.0","community","/etc/snmpget.conf"),
"period", 300,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);
