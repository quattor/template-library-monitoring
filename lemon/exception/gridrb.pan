template monitoring/lemon/exception/gridrb;

"/system/monitoring/exception/_30108/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-ns restart \\\\\" ";
"/system/monitoring/exception/_30108/actuator/active" = false;

### Workload Manager Service
"/system/monitoring/metric/_5241/param" = list("cmdregex", "/opt/glite/bin/glite-wms-workload_manager.*", "uid", "glite");
"/system/monitoring/exception/_30109/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-wm restart \\\\\" ";
"/system/monitoring/exception/_30109/actuator/active" = false;

### Job Controller Service
"/system/monitoring/metric/_5242/param" = list("cmdregex", "/opt/glite/bin/glite-wms-job_controller.*", "uid", "glite");
"/system/monitoring/exception/_30110/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-jc restart \\\\\" ";
"/system/monitoring/exception/_30110/actuator/active" = false;

### Condor Master Service
"/system/monitoring/metric/_5243/param" = list("cmdregex", "condor_master", "uid", "glite");
"/system/monitoring/exception/_30111/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-jc restart \\\\\" ";
"/system/monitoring/exception/_30111/actuator/active" = false;

### Condor Scheduler Service
"/system/monitoring/metric/_5244/param" = list("cmdregex", "condor_schedd.*", "uid", "glite");
"/system/monitoring/exception/_30112/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-jc restart \\\\\" ";
"/system/monitoring/exception/_30112/actuator/active" = false;

### Logd Service
"/system/monitoring/metric/_5245/param" = list("cmdregex", "/opt/glite/bin/glite-lb-logd.*", "uid", "glite");
"/system/monitoring/exception/_30113/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-lb-locallogger restart \\\\\" ";
"/system/monitoring/exception/_30113/actuator/active" = false;

### Interlogd Service
"/system/monitoring/metric/_5246/param" = list("cmdregex", "/opt/glite/bin/glite-lb-interlogd.*", "uid", "glite");
"/system/monitoring/exception/_30114/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-lb-locallogger restart \\\\\" ";
"/system/monitoring/exception/_30114/actuator/active" = false;

### Bkserverd Service
"/system/monitoring/metric/_5247/param" = list("cmdregex", "/opt/glite/bin/glite-lb-bkserverd.*", "uid", "glite");
# No actuator for this service


### Renewd Service
"/system/monitoring/metric/_5248/param" = list("cmdregex", "/opt/glite/bin/glite-proxy-renewd.*", "uid", "glite");
"/system/monitoring/exception/_30116/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-proxy-renewald restart \\\\\" ";
"/system/monitoring/exception/_30116/actuator/active" = false;

### Log Monitor Service
"/system/monitoring/metric/_5249/param" = list("cmdregex", "/opt/glite/bin/glite-wms-log_monitor.*", "uid", "glite");
"/system/monitoring/exception/_30117/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-lm restart \\\\\" ";
"/system/monitoring/exception/_30117/actuator/active" = false;

### Ftpd Service
"/system/monitoring/metric/_5251/param" = list("cmdregex", "ftpd:.*");
"/system/monitoring/exception/_30119/actuator/execve" = "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-ftpd restart \\\\\" ";


### Check the LB proxy service
"/system/monitoring/metric/_5256" = nlist(
        "name",         "lbproxy_count",
        "descr",        "Number of LB proxies processes running.",
        "class",        "system.processCount",
        "param",        list("cmdregex", "/opt/glite/bin/glite-lb-proxy.*", "uid", "glite"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


"/system/monitoring/exception/_30127" = nlist(
        "name",         "lbproxy_wrong",
        "descr",        "Number of LB proxies wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "lbproxy_wrong",  
        "correlation",  "5256:1 < 1",
	"actuator",     nlist("execve",  "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-lb-proxy restart \\\\\" ",
                             "maxruns", 1,
                             "timeout", 0,
                             "active",  true)
);         

"/system/monitoring/exception/_30127/actuator/active" = false;


### Check the WM proxy service
"/system/monitoring/metric/_5257" = nlist(
        "name",         "wmproxy_count",
        "descr",        "Number of WMproxies server processes running.",
        "class",        "system.processCount",
        "param",        list("cmdregex", "glite_wms_wmproxy_httpd.conf", "uid", "glite"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


"/system/monitoring/exception/_30129" = nlist(
        "name",         "wmproxy_wrong",
        "descr",        "Number of WMproxies server processes wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "wmproxy_wrong",  
        "correlation",  "(5257:1 < 1) || (5257:1 > 11)",
        "actuator",     nlist("execve",  "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/glite-wms-wmproxy restart \\\\\" ",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);

"/system/monitoring/exception/_30129/actuator/active" = false;



### Check the RGMA service
"/system/monitoring/metric/_5258" = nlist(
        "name",         "rgma_count",
        "descr",        "Number of rgma processes running.",
        "class",        "system.processCount",
        "param",        list("cmdregex", "rgma-servicetool", "uid", "rgma"),
        "period",       60,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   false,
);


"/system/monitoring/exception/_30130" = nlist(
        "name",         "rgma_wrong",
        "descr",        "Number of rgma server processes wrong.",
        "active",       true,
        "latestonly",   false,
        "importance",   1,
	"minoccurs",    2,
        "alarmtext",    "rgma_wrong",  
        "correlation",  "5258:1 < 1",
        "actuator",     nlist("execve",  "/bin/sh -c \\\\\" . /etc/glite/profile.d/glite_setenv.sh && /opt/glite/etc/init.d/rgma-servicetool restart \\\\\" ",
                              "maxruns", 1,
                              "timeout", 0,
                              "active",  true)
);



