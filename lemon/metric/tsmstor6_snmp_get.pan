#
# SNMP Monitoring of the TSM disk arrays from the console head
# node.  
#
# 6335	    Heartbeat
#
template monitoring/lemon/metric/tsmstor6_snmp_get;

"/system/monitoring/metric/_6335" = nlist(
"name",  "snmpHeartbeat",
"descr", "Monitor SNMP status of Infortrend arrays",
"class", "snmpget.getint",
"param", list("host","tsmstor601 tsmstor602 tsmstor603 tsmstor604 tsmstor605 tsmstor606 tsmstor607 tsmstor608 tsmstor609 tsmstor610 tsmstor611 tsmstor612","oid",".1.3.6.1.4.1.1714.1.1.1.5.0","community","/etc/snmpget.conf"),
"period", 300,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);
