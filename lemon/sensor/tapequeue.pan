#
# monitoring/lemon/sensor/tapequeue
#
# This file contains the sensor definition for the tapequeue sensor
template monitoring/lemon/sensor/tapequeue;

# command line
"/system/monitoring/sensor/tapequeue/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl TapeQueue";

# additional protocols the sensor supports
"/system/monitoring/sensor/tapequeue/supports" = "CFG SOD NoCHK VER";

# module names
"/system/monitoring/sensor/tapequeue/module_names" = "TapeQueue";

# classes
"/system/monitoring/sensor/tapequeue/class" = list(

  	nlist("name", "tapequeue.queueprobedgn",
        	"descr", "Report the Tape Queue analysis by DGN",
        	"field", list(
                	 nlist("name", "AvgWaitTimeRead",     "format", "%ld", "descr", "Avg READ wait time",  "scale", 1.0, "unit", "seconds"),
	                 nlist("name", "AvgWaitTimeWrite",    "format", "%ld", "descr", "Avg WRITE wait time", "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "MaxWaitTimeRead",     "format", "%ld", "descr", "Max READ wait time",  "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "MaxWaitTimeWrite",    "format", "%ld", "descr", "Max WRITE wait time", "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "NumJobsQueueRead",    "format", "%ld", "descr", "Queued READ jobs",    "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsQueueWrite",   "format", "%ld", "descr", "Queued WRITE jobs",   "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsRunningRead",  "format", "%ld", "descr", "Running READ jobs",   "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsRunningWrite", "format", "%ld", "descr", "Running WRITE jobs",  "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumDrivesInTotal",    "format", "%ld", "descr", "Drives in total",     "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumDrivesUsed",       "format", "%ld", "descr", "Drives used",         "scale", 1.0, "unit", "count"),
		)
  	),

  	nlist("name", "tapequeue.queueprobevo",
        	"descr", "report the tape queue analysis vo wise",
        	"field", list(
                	 nlist("name", "AvgWaitTimeRead",     "format", "%ld", "descr", "Avg READ wait time",  "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "AvgWaitTimeWrite",    "format", "%ld", "descr", "Avg WRITE wait time", "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "MaxWaitTimeRead",     "format", "%ld", "descr", "Max READ wait time",  "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "MaxWaitTimeWrite",    "format", "%ld", "descr", "Max WRITE wait time", "scale", 1.0, "unit", "seconds"),
                	 nlist("name", "NumJobsQueueRead",    "format", "%ld", "descr", "Queued READ jobs",    "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsQueueWrite",   "format", "%ld", "descr", "Queued WRITE jobs",   "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsRunningRead",  "format", "%ld", "descr", "Running READ jobs",   "scale", 1.0, "unit", "count"),
                	 nlist("name", "NumJobsRunningWrite", "format", "%ld", "descr", "Running WRITE jobs",  "scale", 1.0, "unit", "count"),
		)
  	),
);
