############################################################
#
# template monitoring/lemon/metric/gridlb
#
############################################################

template monitoring/lemon/metric/gridlb;

include { 'monitoring/lemon/metric/wm' };

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


### Disable some exception related to the RAID disks available on the WMS but not on the LB
"/system/monitoring/exception/_30124/active" = false;
"/system/monitoring/exception/_30125/active" = false;

### Partition dedicated to MySQL is located in /opt
"/system/monitoring/exception/_30126/correlation" = "(9104:1 eq '/opt') && (9104:5 > 90)";
"/system/monitoring/exception/_30126/descr" = "MySQL partition (/opt) full).";



### Network Server Service -- no such service on LB node
"/system/monitoring/metric/_5240/active" = false;
"/system/monitoring/exception/_30108/active" = false;
"/system/monitoring/exception/_30108/actuator/active" = false;

### Workload Manager Service -- no such service on LB node
"/system/monitoring/metric/_5241/active" = false;
"/system/monitoring/exception/_30109/active" = false;
"/system/monitoring/exception/_30109/actuator/active" = false;

### Job Controller Service -- no such service on LB node
"/system/monitoring/metric/_5242/active" = false;
"/system/monitoring/exception/_30110/active" = false;
"/system/monitoring/exception/_30110/actuator/active" = false;

### Condor Master Service -- no such service on LB node
"/system/monitoring/metric/_5243/active" = false;
"/system/monitoring/exception/_30111/active" = false;
"/system/monitoring/exception/_30111/actuator/active" = false;

### Condor Scheduler Service -- no such service on LB node
"/system/monitoring/metric/_5244/active" = false;
"/system/monitoring/exception/_30112/active" = false;
"/system/monitoring/exception/_30112/actuator/active" = false;

### Renewd Service -- no such service on LB node
"/system/monitoring/metric/_5248/active" = false;
"/system/monitoring/exception/_30116/active" = false;
"/system/monitoring/exception/_30116/actuator/active" = false;

### Log Monitor Service -- no such service on LB node
"/system/monitoring/metric/_5249/active" = false;
"/system/monitoring/exception/_30117/active" = false;
"/system/monitoring/exception/_30117/actuator/active" = false;

### Ftpd Service -- no such service on LB node
"/system/monitoring/metric/_5251/active" = false;
"/system/monitoring/exception/_30119/active" = false;
"/system/monitoring/exception/_30119/actuator/active" = false;

### Check the number of dglogd files -- no such files on LB nodes
"/system/monitoring/metric/_5252/active" = false;
"/system/monitoring/exception/_30120/active" = false;
#"/system/monitoring/exception/_30120/actuator/active" = false;

### Check the size of the input.fl file -- no such files on LB nodes
"/system/monitoring/metric/_5253/active" = false;
"/system/monitoring/exception/_30121/active" = false;
#"/system/monitoring/exception/_30121/actuator/active" = false;

### Check the size of the queue.fl file -- no such files on LB nodes
"/system/monitoring/metric/_5254/active" = false;
"/system/monitoring/exception/_30122/active" = false;
#"/system/monitoring/exception/_30122/actuator/active" = false;
