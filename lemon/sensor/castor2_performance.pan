#
# monitoring/lemon/sensor/castor2_performance
#
template monitoring/lemon/sensor/castor2_performance;

#
# LSF Module
#
# definition
"/system/monitoring/sensor/castor2_lsf/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::LSF";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_lsf" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_lsf/module_names" = "Castor2::LSF";

# classes
"/system/monitoring/sensor/castor2_lsf/class" = list(
	nlist("name", "Castor2.Probe",
                "descr", "top dlf errors in last hour",
                "field", list(
                        nlist("name", "time_since_last",   "format", "%ld"), 
                        nlist("name", "tim_rfio_open_w",   "format", "%ld"), 
                        nlist("name", "tim_rfio_write",    "format", "%ld"), 
                        nlist("name", "tim_rfio_close_w",  "format", "%ld"), 
                        nlist("name", "tim_rfio_open_r",   "format", "%ld"), 
                        nlist("name", "tim_rfio_read",     "format", "%ld"), 
                        nlist("name", "tim_rfio_close_r",  "format", "%ld"), 
                        nlist("name", "tim_stager_qry",    "format", "%ld"), 
                        nlist("name", "tim_stager_rm",     "format", "%ld"), 
                        nlist("name", "time_window",       "format", "%ld"), 
                        nlist("name", "err_rfio_open_w",   "format", "%ld"), 
                        nlist("name", "err_rfio_write",    "format", "%ld"), 
                        nlist("name", "err_rfio_close_w",  "format", "%ld"), 
                        nlist("name", "err_rfio_open_r",   "format", "%ld"), 
                        nlist("name", "err_rfio_read",     "format", "%ld"), 
                        nlist("name", "err_rfio_close_r",  "format", "%ld"), 
                        nlist("name", "err_stager_qry",    "format", "%ld"), 
                        nlist("name", "err_stager_rm",     "format", "%ld"),                 
                        nlist("name", "err_corruptions",   "format", "%ld"),       
		),
	),
	nlist("name", "Castor2.NSLSLatency",
                "descr", "NSLS latency",
                "field", list(
                        nlist("name", "userLatency",   "format", "%.2f"),
                        nlist("name", "sysLatency",    "format", "%.2f"),
                        nlist("name", "totalLatency",  "format", "%.2f"),
		),
	),
	nlist("name", "Castor2.JobsPending",
    		"descr","Queries node to find number of jobs pending",
    		"field", list(
                  	nlist("name", "runningjobs",   "format", "%ld"),
                  	nlist("name", "pendingjobs",   "format", "%ld"),
                  	nlist("name", "suspendedjobs", "format", "%ld"),
                 ),
  	),
	nlist("name", "Castor2.OldJobsPending",
    		"descr","Old jobs in pending state - normally due to requiring specific machine",
    		"field", list(
                  	nlist("name", "host",    "format", "%20s"),
                  	nlist("name", "jobID",   "format", "%ld"),
                  	nlist("name", "subDate", "format", "%20s"),
                 ),
  	),
);

#
# Network Module
#
# definition
"/system/monitoring/sensor/castor2_network/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::Network";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_network" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_network/module_names" = "Castor2::Network";

# classes
"/system/monitoring/sensor/castor2_network/class" = list(

	nlist("name", "Castor2.NodeNetworkTraffic",
    		"descr", "returns chain name, avg. data in last time step",
    		"field", list(
                  	nlist("name", "chainName",    "format", "%20s", "primary", true),
                  	nlist("name", "dataRate_in",  "format", "%ld",  "unit", "bytes", "scale", 1.0),
                  	nlist("name", "dataRate_out", "format", "%ld",  "unit", "bytes", "scale", 1.0),
                 ),
	),

	nlist("name", "Castor2.RunningRfio",
    		"descr", "returns ",
    		"field", list(
                  	nlist("name", "stageCount",  "format", "%ld", "unit", "bytes", "scale", 1.0),
                  	nlist("name", "userCount", "format", "%ld", "unit", "bytes", "scale", 1.0),
                 ),
	),
	nlist("name", "Castor2.RunningGridFTP",
    		"descr", "returns ",
    		"field", list(
                  	nlist("name", "total",  "format", "%ld", "unit", "bytes", "scale", 1.0),
                 ),
	),

);


#
# DLF Module
#
# definition

"/system/monitoring/sensor/castor2_dlf/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::DLF";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_dlf" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_dlf/module_names" = "Castor2::DLF";

# classes
"/system/monitoring/sensor/castor2_dlf/class" = list(

	nlist("name", "Castor2.DLFErrors",
		"descr", "returns top 5 errors by facility, msg_no and count msgs in last hour",
		"field", list(
			nlist("name", "facility",  "format", "%20s", "primary", true),
			nlist("name", "msg_no",    "format", "%ld",  "primary", true),
			nlist("name", "msg_text",  "format", "%255s"),
			nlist("name", "count",     "format", "%ld"),
		),
	),

        nlist("name", "Castor2.Job",
                "descr", "returns ",
                "field", list(
 			nlist("name", "JobType",   "format", "%ld", "primary", true),
                        nlist("name", "min_time",  "format", "%4f"),
                        nlist("name", "max_time",  "format", "%4f"),
 		        nlist("name", "average",   "format", "%4f"),
                        nlist("name", "std_dev",   "format", "%4f"),
                        nlist("name", "starting",  "format", "%ld"),
                        nlist("name", "exiting",   "format", "%ld"),
                        nlist("name", "interval",  "format", "%ld"),
                ),
        ),
        nlist("name", "Castor2.Request",
                "descr", "returns ",
                "field", list(
                       nlist("name", "ReqType",    "format", "%ld", "primary", true),
                        nlist("name", "min_time",  "format", "%4f"),
                        nlist("name", "max_time",  "format", "%4f"),
                        nlist("name", "average",   "format", "%4f"),
                        nlist("name", "std_dev",   "format", "%4f"),
                        nlist("name", "req_count", "format", "%ld"),
                        nlist("name", "interval",  "format", "%ld"),

                ),
        ), 
);


#
#  Misc Module
#
# definition
"/system/monitoring/sensor/castor2_misc/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::Misc";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_misc" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_misc/module_names" = "Castor2::Misc";

# classes
"/system/monitoring/sensor/castor2_misc/class" = list(
	nlist("name", "Castor2.DiskpoolInfo",
    		"descr","returns diskpool general info",
	        "field",list(
			nlist("name", "hostcount", "format", "%2f"),
             	    	nlist("name", "fscount",   "format", "%2f"),
			nlist("name", "totalsize", "format", "%2f"),
			nlist("name", "occupancy", "format", "%2f"),
		),
  	),

 	nlist("name", "Castor2.OrphanTape",
    		"descr","returns string of files which are orphaned",
    		"field", list(
			nlist("name", "results", "format", "%ld"),
       		),
  	), 
);

#
#  StagerDB Module
#
# definition
"/system/monitoring/sensor/castor2_stagerdb/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::StagerDB";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_stagerdb" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_stagerdb/module_names" = "Castor2::StagerDB";

# classes
"/system/monitoring/sensor/castor2_stagerdb/class" = list(
	nlist("name", "Castor2.TableSize", 
                "descr", "size of key castor2 tables", 
                "field", list( 
                        nlist("name", "subrequest",   "format", "%ld"),
		  	nlist("name", "diskcopy", "format", "%ld"),
                        nlist("name", "tapecopy",   "format", "%ld"),                        
                        nlist("name", "castorfile",   "format", "%ld"),                        
                        nlist("name", "id2type",   "format", "%ld"), 
                ), 
        ), 
	nlist("name", "Castor2.DiskServerStatus",
		"descr", "Report on number of files per filesystem in each diskcopy state",
                "field", list(
                        nlist("name", "filesystem", "format", "%200s", "primary", true),
                        nlist("name", "statusID",   "format", "%ld",  "primary", true),
                        nlist("name", "total",      "format", "%ld")
			) 
	),
	nlist("name", "Castor2.Segment",
    		"descr","returns segment status on the castor stager",
    		"field",list(nlist("name","unprocessed","format","%ld"),
                 	nlist("name","filecopied","format","%ld"),
                 	nlist("name","failed","format","%ld"),
                 	nlist("name","selected","format","%ld"),
                 	nlist("name","retried","format","%ld"),
            	) 
  	),
  	nlist("name", "Castor2.Stream",
    		"descr","returns stream status on the castor stager",
    		"field",list(nlist("name","pending","format","%ld"),
                 	nlist("name","waitdrive","format","%ld"),
                 	nlist("name","waitmount","format","%ld"),
                 	nlist("name","running","format","%ld"),
                 	nlist("name","waitspace","format","%ld"),
                 	nlist("name","created","format","%ld"),
            	)
  	),

  	nlist("name", "Castor2.SubRequest",
    		"descr","returns subrequest status on the castor stager",
    		"field",list(nlist("name","started","format","%ld"),
                 	nlist("name","restart","format","%ld"),
                 	nlist("name","retry","format","%ld"),
                 	nlist("name","waitshed","format","%ld"),
                 	nlist("name","waittaperecall","format","%ld"),
                 	nlist("name","waitsubreq","format","%ld"),
                 	nlist("name","ready","format","%ld"),
                	nlist("name","failed","format","%ld"),
                 	nlist("name","finished","format","%ld"),
                 	nlist("name","failed_finished","format","%ld"),
                 	nlist("name","failed_answering","format","%ld"),
                ),
  	),

  	nlist("name", "Castor2.TapeCopy",
    		"descr","returns tapecopy status on the castor stager",
    		"field",list(nlist("name","created","format","%ld"),
                 	nlist("name","tobemigrated","format","%ld"),
                 	nlist("name","waitinstreams","format","%ld"),
                 	nlist("name","selected","format","%ld"),
                 	nlist("name","toberecalled","format","%ld"),
                 	nlist("name","staged","format","%ld"),
                 	nlist("name","failed","format","%ld"),
            	),
  	),

  	nlist("name", "Castor2.Tape",
    		"descr","returns tape status on the castor stager",
    		"field",list(nlist("name","unused","format","%ld"),
                 	nlist("name","pending","format","%ld"),
                 	nlist("name","waitdrive","format","%ld"),
                 	nlist("name","waitmount","format","%ld"),
                 	nlist("name","mounted","format","%ld"),
                 	nlist("name","finished","format","%ld"),
                 	nlist("name","failed","format","%ld"),
                 	nlist("name","unknown","format","%ld"),
            	),
  	),

	nlist("name", "Castor2.DiskCopy",
    		"descr","returns disk copy status on the castor stager",
    		"field",list(nlist("name","staged","format","%ld"),
                 	nlist("name","waitdisk2disk","format","%ld"),
                 	nlist("name","waitrecall","format","%ld"),
                 	nlist("name","deleted","format","%ld"),
                 	nlist("name","failed","format","%ld"),
                 	nlist("name","waitfs","format","%ld"),
                 	nlist("name","stageout","format","%ld"),
                 	nlist("name","invalid","format","%ld"),
                 	nlist("name","gccandidate","format","%ld"),
                 	nlist("name","beingdel","format","%ld"),
                 	nlist("name","canbemigr","format","%ld"),
                 	nlist("name","waitfs_sched","format","%ld"),
            	),
  	),
        nlist("name", "Castor2.MetaRecall",
                "descr", "Info on running migrations - returns min, max, avg times and count",
                "field", list(
                        nlist("name", "min_time",  "format", "%ld"),
                        nlist("name", "max_time",  "format", "%ld"),
                        nlist("name", "avg_time",  "format", "%ld"),
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.MetaMigPending",
                "descr", "Info on pending migrations - returns min, max, avg times and count",
                "field", list(
                        nlist("name", "min_time",  "format", "%ld"),
                        nlist("name", "max_time",  "format", "%ld"),
                        nlist("name", "avg_time",  "format", "%ld"),
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.MetaMigSelected",
                "descr", "Info on selected migrations - returns min, max, avg times and count",
                "field", list(
                        nlist("name", "min_time",  "format", "%ld"),
                        nlist("name", "max_time",  "format", "%ld"),
                        nlist("name", "avg_time",  "format", "%ld"),
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.VeryOldFiles",
                "descr", "count of pending files in stager with age gt than 30 days",
                "field", list(
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.OldStageOut",
                "descr", "count of stageout files with last access time gt 10 days",
                "field", list(
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.WaitTapeRecall",
                "descr", "count of waittaperecall files with last access time gt 2 days",
                "field", list(
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
	nlist("name", "Castor2.OldWaitDisk2DiskCopy",
                "descr", "count of WaitDisk2DiskCopy files with last access time gt 2 days",
                "field", list(
                        nlist("name", "count",     "format", "%ld"),
		),
        ),
        nlist("name", "Castor2.AccessCountDist",
                "descr", "returns svc, period name, count, total_accesses",
                "field", list(
                        nlist("name", "distPeriod",   "format", "%20s", "primary", true),
                        nlist("name", "count",        "format", "%ld",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
        nlist("name", "Castor2.FileSizeDist",
                "descr", "returns svc, period name, count, filespace",
                "field", list(
                        nlist("name", "distPeriod",   "format", "%20s", "primary", true),
                        nlist("name", "count",        "format", "%ld",  "unit", "bytes", "scale", 1.0),
                        nlist("name", "totalsize",    "format", "%ld",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
        nlist("name", "Castor2.FileAgeDist",
                "descr", "returns svc, period name, count",
                "field", list(
                        nlist("name", "distPeriod",   "format", "%20s", "primary", true),
                        nlist("name", "count",        "format", "%ld",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
        nlist("name", "Castor2.MigLogSvc",
                "descr", "returns SvcClass name and size of files in that svcclass",
                "field", list(
                        nlist("name", "Count",  "format", "%3f",  "unit", "bytes", "scale", 1.0),
                        nlist("name", "TotalSize", "format", "%3f",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
        nlist("name", "Castor2.MigLogPool",
                "descr", "returns Pool name and size of files in that pool",
                "field", list(
                        nlist("name", "Count",  "format", "%3f",  "unit", "bytes", "scale", 1.0),
                        nlist("name", "TotalSize", "format", "%3f",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
        nlist("name", "Castor2.MigLogAll",
                "descr", "returns SvcClass name, PoolName and size of files in that svcclass & pool",
                "field", list(
                        nlist("name", "SvcName",           "format", "%20s", "primary", true),
                        nlist("name", "PoolName",          "format", "%20s", "primary", true),
                        nlist("name", "Count",  "format", "%3f",  "unit", "bytes", "scale", 1.0),
                        nlist("name", "TotalSize", "format", "%3f",  "unit", "bytes", "scale", 1.0),
                 ),
        ),
);

#
# Stall Module
#
# definition
"/system/monitoring/sensor/castor2_stall/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Castor2::Stall";

# additional protocols the sensor supports
# "/system/monitoring/sensor/castor2_stall" = "CFG SOD CHK";

# module names
"/system/monitoring/sensor/castor2_stall/module_names" = "Castor2::Stall";

# classes
"/system/monitoring/sensor/castor2_stall/class" = list(
  	nlist("name", "Castor2.Stall",
    		"descr", "returns pointer to array of pools and number mig files older than 6 hours",
    		"field", list(
                  	nlist("name","onehour","format","%ld"),
                  	nlist("name","interval1","format","%ld"),
                  	nlist("name","interval2","format","%ld"),
                  	nlist("name","interval3","format","%ld"),
                  	nlist("name","interval4","format","%ld"),
                  	nlist("name","interval5","format","%ld"),
             	),
  	)
);

