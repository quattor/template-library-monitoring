template monitoring/lemon/exception/lcgrb;

"/system/monitoring/exception/_30108/actuator/execve" = "/sbin/service edg-wl-ns restart";


### Workload Manager Service
"/system/monitoring/metric/_5241/param" = list("cmdregex", "/opt/edg/bin/edg-wl-workload_manager.*", "uid", "edguser");
"/system/monitoring/exception/_30109/actuator/execve" = "/sbin/service edg-wl-wm restart";


### Job Controller Service
"/system/monitoring/metric/_5242/param" = list("cmdregex", "/opt/edg/bin/edg-wl-job_controller.*", "uid", "edguser");
"/system/monitoring/exception/_30110/actuator/execve" = "/sbin/service edg-wl-jc restart";


### Condor Master Service
"/system/monitoring/metric/_5243/param" = list("cmdline", "/opt/condor/sbin/condor_master", "uid", "edguser");
"/system/monitoring/exception/_30111/actuator/execve" = "/sbin/service edg-wl-jc restart";


### Condor Scheduler Service
"/system/monitoring/metric/_5244/param" = list("cmdregex", "condor_schedd.*", "uid", "edguser");
"/system/monitoring/exception/_30112/actuator/execve" = "/sbin/service edg-wl-jc restart";


### Logd Service
"/system/monitoring/metric/_5245/param" = list("cmdregex", "/opt/edg/sbin/edg-wl-logd.*", "uid", "edguser");
"/system/monitoring/exception/_30113/actuator/execve" =  "/sbin/service edg-wl-locallogger restart";


### Interlogd Service
"/system/monitoring/metric/_5246/param" = list("cmdregex", "/opt/edg/sbin/edg-wl-interlogd.*", "uid", "edguser");
"/system/monitoring/exception/_30114/actuator/execve" = "/sbin/service edg-wl-locallogger restart";


### Bkserverd Service
"/system/monitoring/metric/_5247/param" = list("cmdregex", "/opt/edg/sbin/edg-wl-bkserverd.*", "uid", "edguser");
"/system/monitoring/exception/_30115/correlation" = "5247:1 < 1"; 
# No actuator for this servic2e


### Renewd Service
"/system/monitoring/metric/_5248/param" = list("cmdregex", "/opt/edg/sbin/edg-wl-renewd.*", "uid", "edguser");
"/system/monitoring/exception/_30116/actuator/execve" = "/sbin/service edg-wl-proxyrenewal restart";


### Log Monitor Service
"/system/monitoring/metric/_5249/param" = list("cmdregex", "edg-wl-log_monitor.*", "uid", "edguser");
"/system/monitoring/exception/_30117/actuator/execve" = "/sbin/service edg-wl-lm restart";


### Mon Job Status Service (on LCG RBs only)
"/system/monitoring/metric/_5250" = nlist(
        "name",         "mjs_count",
        "descr",        "Number of log monitor processes running.",
        "class",        "system.processCount",
        "param",        list("cmdregex", "/usr/bin/python /opt/lcg/libexec/lcg-mon-logfile-daemon.py.*", "uid", "daemon"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


"/system/monitoring/exception/_30118" = nlist(
        "name",         "mjs_wrong",
        "descr",        "Number of lcg-mon-job-status process wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "mjs_wrong",  
        "correlation",  "5250:1 < 1",
        "actuator",     nlist("execve",  "/sbin/service lcg-mon-job-status restart",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);




"/system/monitoring/exception/_30119/actuator/execve" = "/sbin/service edg-wl-ftpd restart";


### Check the number of dglogd files
"/system/monitoring/metric/_5252/param" = list("dir", "/var/tmp/", "regex", ".*/dg20logd_.*");
# No actuator for this service


### Check the size of the input.fl file 
"/system/monitoring/metric/_5253/param" = list("file", "/var/edgwl/workload_manager/input.fl");
# No actuator for this service


### Check the size of the queue.fl file
"/system/monitoring/metric/_5254/param" = list("file", "/var/edgwl/jobcontrol/queue.fl");
# No actuator for this service


### Log Monitor Service (check number of file descriptors for this service)
"/system/monitoring/metric/_5255" = nlist(
        "name",         "fd_lm_count",
        "descr",        "The number of file descriptors opened by the log monitor process.",
        "class",        "system.processFDCount",
        "param",        list("cmdregex", "edg-wl-log_monitor.*", "uid", "edguser"),
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


"/system/monitoring/exception/_30123" = nlist(
        "name",         "fd_lm_wrong",
        "descr",        "Number of file descriptors opened by log monitor too high.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "fd_lm_wrong",  
        "correlation",  "5255:1 > 950",
);


