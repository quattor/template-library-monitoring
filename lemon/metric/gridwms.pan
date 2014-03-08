############################################################
#
# template monitoring/lemon/metric/gridwms
#
############################################################

template monitoring/lemon/metric/gridwms;

include { 'monitoring/lemon/metric/wm' };

### Network Server Service
"/system/monitoring/metric/_5240/active" = false;
#"/system/monitoring/metric/_5240/param" = list("cmdregex", "/opt/glite/bin/glite-wms-manager_ns_daemon.*", "uid", "glite");
#"/system/monitoring/exception/_30129/actuator/active" = false;



### Check the RGMA service
#"/system/monitoring/metric/_5258" = nlist(
#        "name",         "rgma_count",
#        "descr",        "Number of rgma processes running.",
#        "class",        "system.processCount",
#        "param",        list("cmdregex", "rgma-servicetool", "uid", "rgma"),
#        "period",       60,
#        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
#        "active",       true,
#        "latestonly",   false,
#);



### Check the number of dglogd files
"/system/monitoring/metric/_5252/param" = list("dir", "/var/glite/log/", "regex", ".*/dglogd.*");
# No actuator for this service


### Check the size of the input.fl file 
"/system/monitoring/metric/_5253/param" = list("file", "/var/glite/workload_manager/input.fl");
# No actuator for this service


### Check the size of the queue.fl file
"/system/monitoring/metric/_5254/param" = list("file", "/var/glite/jobcontrol/queue.fl");
# No actuator for this service

