#
# monitoring/lemon/exception/linux
#
# This file contains the exceptionf for the linux sensor, to be used in conjunction with
# the lemon-sensor-exception

# Dependancies
#    - Requires: lemon-sensor-exception     >= 1.0.2-1
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
# Note: all actuators (automated recovery actions) are turned off by default
#
template monitoring/lemon/exception/linux;

"/system/monitoring/exception/_30008" = nlist(
	"name",      	"high_load",
	"descr",     	"Load exceeded allowed maximum",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"20002:1 > 16"
);

"/system/monitoring/exception/_30009" = nlist(
	"name",      	"swap_full",
	"descr",     	"Swap utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation", 	"20003:1 > 95"
);

"/system/monitoring/exception/_30021" = nlist(
	"name",      	"crond_wrong",
	"descr",     	"Cron daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"43:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service crond start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30022" = nlist(
	"name",      	"ssh_wrong",
	"descr",     	"Ssh daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation",	"4006:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service sshd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30023" = nlist(
	"name",      	"syslogd_wrong",
	"descr",     	"Syslog daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation", 	"4014:1 < 1",
	"actuator",	 nlist("execve",  "/sbin/service syslogd start",
			       "maxruns", 3,
			       "timeout", 0,
			       "active",  true)
);

"/system/monitoring/exception/_30025" = nlist(
	"name",      	"portmap_wrong",
	"descr",     	"Portmap daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation",	"4013:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service portmap start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30027" = nlist(
	"name",      	"xinetd_wrong",
	"descr",     	"Xinetd daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"5026:1 !range '1-5'",
	"actuator", 	nlist("execve",  "/sbin/service xinetd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30032" = nlist(
	"name",      	"klogd_wrong",
	"descr",     	"Klog daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation", 	"4003:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service syslog start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30033" = nlist(
	"name",      	"sendmail_wrong",
	"descr",     	"Sendmail daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation",	"4012:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service sendmail start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

"/system/monitoring/exception/_30057" = nlist(
	"name",      	"cupsd_wrong",
	"descr",     	"cups daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation", 	"32:1 != 1",
	"actuator", 	nlist("execve",  "/etc/init.d/cups restart",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);

# End-of-File
