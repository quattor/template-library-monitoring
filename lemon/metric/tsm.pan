############################################################
#
# template monitoring/lemon/metric/tsm
# 
############################################################
  
template monitoring/lemon/metric/tsm;
        
"/system/monitoring/metric/_12003" = nlist(
        "name",         "dsmserv",
        "descr",        "\"tsm\" TSM server daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "dsmserv", "ppid", "1"),
        "period",       60,  
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);"/system/monitoring/metric/_12004" = nlist(
        "name",         "IBMtape",
        "descr",        "\"tsm\" IBM tape daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "IBMtaped", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);"/system/monitoring/metric/_12005" = nlist(
        "name",         "lin_tape",
        "descr",        "\"tsm\" IBM lin_tape daemon",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "lin_taped", "ppid", "1"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);