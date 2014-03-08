template monitoring/lemon/exception/tsm;

        
"/system/monitoring/exception/_30100" = nlist(
        "name",         "dsmserv_wrong",
        "descr",        "tsm dsmserv missing",
        "active",       true,
        "latestonly",   false,
        "importance",   3,
        "alarmtext",    "dsmserv_wrong",
        "correlation",  "12003:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service dsmserv start",
                              "maxruns", 3,   
                              "timeout", 0,
                              "active",  false)
);
  


  
"/system/monitoring/exception/_30101" = nlist(
        "name",         "IBMtaped_wrong",
        "descr",        "IBMtaped missing",
        "active",       true,
        "latestonly",   false,
        "importance",   3,
        "alarmtext",    "IBMtaped_wrong",
        "correlation",  "12004:1 < 1",   
        "actuator",     nlist("execve",  "/sbin/service IBMtaped start",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  false)
);
  


  
"/system/monitoring/exception/_30102" = nlist(
        "name",         "lin_taped_wrong",
        "descr",        "lin_taped",
        "active",       false,
        "latestonly",   false,
        "importance",   3,
        "alarmtext",    "lin_taped_wrong",
        "correlation",  "12005:1 < 1",   
        "actuator",     nlist("execve",  "/sbin/service lin_tape start",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  false)
);
  


