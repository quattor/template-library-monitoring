template monitoring/lemon/exception/snmptrap;


"/system/monitoring/exception/_33007"=nlist(
        "name",        "SnmpInfoTrap",
        "descr",       "Received SNMP trap with severity INFO",
        "active",      true,
        "latestonly",  false,
        "importance",  2,
	# Generate alarm on behalf of any machine: add *: below
        "correlation", "*:9506:1 > 0",
);





"/system/monitoring/exception/_33006"=nlist(
        "name",        "SnmpWarningTrap",
        "descr",       "Received SNMP trap with severity WARNING",
        "active",      true,
        "latestonly",  false,
        "importance",  2,
        # Generate alarm on behalf of any machine: add *: below
        "correlation", "*:9505:1 > 0",
);




"/system/monitoring/exception/_33005"=nlist(
        "name",        "SnmpCriticalTrap",
        "descr",       "Received SNMP trap with severity CRITICAL",
        "active",      true,
        "latestonly",  false,
        "importance",  2,
        # Generate alarm on behalf of any machine: add *: below
        "correlation", "*:9504:1 > 0",
);


