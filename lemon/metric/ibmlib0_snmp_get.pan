#
# SNMP Monitoring of the TSM robot ibmlib0
#
# 9508	    Media Changer Availability
# 9509	    Media Changer Operational
# 9510	    Number of tapes in the library
# 9511	    Number of drives
# 9512	    Firmware version
#
template monitoring/lemon/metric/ibmlib0_snmp_get;

"/system/monitoring/metric/_9508" = nlist(
"name",  "medichgavailability",
"descr", "media changer availability",
"class", "snmpget.getint",
"param", list("host","ibmlib0","oid",".1.3.6.1.4.1.14851.3.1.11.2.1.8.1","community","/etc/snmpget.conf"),
"period", 300,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);

"/system/monitoring/metric/_9509" = nlist(
"name",  "mediachgopstatus",
"descr", "media changer operational status ",
"class", "snmpget.getint",
"param", list("host","ibmlib0","oid",".1.3.6.1.4.1.14851.3.1.11.2.1.9.1","community","/etc/snmpget.conf"),
"period", 300,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);

"/system/monitoring/metric/_9510" = nlist(
"name", " nrmediainlibrary",
"descr", "number of physical media on the library",
"class", "snmpget.getint",
"param", list("host","ibmlib0","oid",".1.3.6.1.4.1.14851.3.1.13.2.0","community","/etc/snmpget.conf"),
"period", 43200,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);

"/system/monitoring/metric/_9511" = nlist(
"name",  "nrmediaaccessdev" ,
"descr", "number Of Media Access Devices on the Library",
"class", "snmpget.getint",
"param", list("host","ibmlib0","oid",".1.3.6.1.4.1.14851.3.1.6.1.0","community","/etc/snmpget.conf"),
"period", 43200,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);

"/system/monitoring/metric/_9512" = nlist(
"name", "firmwareversion",
"descr", "software Library Element Version",
"class", "snmpget.getint",
"param", list("host","ibmlib0","oid",".1.3.6.1.4.1.14851.3.1.9.2.1.3.43","community","/etc/snmpget.conf"),
"period", 43200,
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
"active", true,
"latestonly", false,
);
