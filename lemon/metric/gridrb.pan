############################################################
#
# template monitoring/lemon/metric/gridrb
#
############################################################

template monitoring/lemon/metric/gridrb;

include { 'monitoring/lemon/metric/wm' };

### Network Server Service
"/system/monitoring/metric/_5240/param" = list("cmdregex", "/opt/glite/bin/glite-wms-manager_ns_daemon.*", "uid", "glite");### Check the number of dglogd files
"/system/monitoring/metric/_5252/param" = list("dir", "/tmp/", "regex", ".*/dglogd.*");
# No actuator for this service


### Check the size of the input.fl file 
"/system/monitoring/metric/_5253/param" = list("file", "/var/glite/workload_manager/input.fl");
# No actuator for this service


### Check the size of the queue.fl file
"/system/monitoring/metric/_5254/param" = list("file", "/var/glite/jobcontrol/queue.fl");
# No actuator for this service

