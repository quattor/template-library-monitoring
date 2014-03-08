############################################################
#
# template monitoring/lemon/metric/wm
#
# template to use for the nodes "worload management"
# ie. LCG RBs and gLite WMS
#
############################################################

template monitoring/lemon/metric/wm;

### Network Server Service
"/system/monitoring/metric/_5240" = nlist(
        "name",         "ns_count",
        "descr",        "Number of network server processes running.",
        "class",        "system.processCount",
	"period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Workload Manager Service
"/system/monitoring/metric/_5241" = nlist(
        "name",         "wm_count",
        "descr",        "Number of worload manager processes running.",
        "class",        "system.processCount",
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Job Controller Service
"/system/monitoring/metric/_5242" = nlist(
        "name",         "jobcontroller_count",
        "descr",        "Number of job controller processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Condor Master Service
"/system/monitoring/metric/_5243" = nlist(
        "name",         "condormaster_count",
        "descr",        "Number of condor master processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Condor Scheduler Service
"/system/monitoring/metric/_5244" = nlist(
        "name",         "condorschedd_count",
        "descr",        "Number of condor scheduler processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Logd Service
"/system/monitoring/metric/_5245" = nlist(
        "name",         "logd_count",
        "descr",        "Number of logd processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Interlogd Service
"/system/monitoring/metric/_5246" = nlist(
        "name",         "interlogd_count",
        "descr",        "Number of interlogd processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Bkserver Service
"/system/monitoring/metric/_5247" = nlist(
        "name",         "bkserverd_count",
        "descr",        "Number of bkserverd processes running.",
        "class",        "system.processCount",
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Renewd Service
"/system/monitoring/metric/_5248" = nlist(
        "name",         "renewd_count",
        "descr",        "Number of renewd processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Log Monitor Service
"/system/monitoring/metric/_5249" = nlist(
        "name",         "lm_count",
        "descr",        "Number of log monitor processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Ftpd Service
"/system/monitoring/metric/_5251" = nlist(
        "name",         "ftpd_count",
        "descr",        "Number of ftpd processes running.",
        "class",        "system.processCount",
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Check the number of dglogd files
"/system/monitoring/metric/_5252" = nlist(
        "name",         "dglogd_count",
        "descr",        "Number of dglogd_* files.",
        "class",        "file.filecount",
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Check the size of the input.fl file 
"/system/monitoring/metric/_5253" = nlist(
        "name",         "inputfl_size",
        "descr",        "The size of the input.fl file.",
        "class",        "file.size",
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Check the size of the queue.fl file
"/system/monitoring/metric/_5254" = nlist(
        "name",         "queuefl_size",
        "descr",        "The size of the queue.fl file.",
        "class",        "file.size",
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);### Check the occupancy of the RAID disk partitions (/data01, /data02 and /data03)