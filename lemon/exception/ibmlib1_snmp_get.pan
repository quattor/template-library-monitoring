template monitoring/lemon/exception/ibmlib1_snmp_get;


"/system/monitoring/exception/_33011" = nlist(
"name", "mediachg_not_full_power",
"descr", "the library media changer is not running full power",
"active", true,
"importance", 3,
"latestonly", false,
"period", 60,
"alarmtext", "mediachg_not_full_power",
"correlation", "*:9508:1 != 3",
);


"/system/monitoring/exception/_33012" = nlist(
"name", "mediachg_not_ok",
"descr", "the library media changer operational status not OK",
"active", true,
"importance", 3,
"latestonly", false,
"period", 60,
"alarmtext", "mediachg_not_ok",
"correlation", "*:9509:1 != 2",
);


"/system/monitoring/exception/_33013" = nlist(
"name", "nr_drives_wrong ",
"descr", "the number of media access devices in the library is wrong",
"active", true,
"importance", 3,
"latestonly", false,
"period", 60,
"alarmtext", "nr_drives_wrong",
"correlation", "*:9511:1 != 42",
);

