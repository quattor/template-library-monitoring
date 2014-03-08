# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/gridbdii;


"/system/monitoring/metric/_20048" = nlist(
        "name",         "BdiiStatus",
        "descr",        "BDII Status",
        "class",        "GridBdii.BdiiStatus",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20049" = nlist(
        "name",         "BdiiLoad",
        "descr",        "BDII Load",
        "class",        "GridBdii.BdiiLoad",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20050" = nlist(
        "name",         "BdiiSlapd",
        "descr",        "BDII Slapd proc number",
        "class",        "GridBdii.BdiiSlapd",
        "period",       600,
        "active",       true,
        "latestonly",   false,
);

# End-of-File
