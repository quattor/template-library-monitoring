#
# monitoring/metric/castor2_performance
#
template monitoring/lemon/metric/castor2_performance;

#
# Network Module
#

"/system/monitoring/metric/_6260" = nlist(
        "name",         "NodeNetworkTraffic",
        "descr",        "Network traffic by iptables chain",
        "class",        "Castor2.NodeNetworkTraffic",
        "period",       600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6251" = nlist(
	"name", 	"RunningRfio",
	"descr", 	"count of running rfio processes for stage and users",
	"class", 	"Castor2.RunningRfio",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG"),
	"period", 	120,
	"active", 	false,
	"latestonly",	false,
);
"/system/monitoring/metric/_6252" = nlist(
	"name", 	"RunningGridFTP",
	"descr", 	"count of running GridFTP processes for stage and users",
	"class", 	"Castor2.RunningGridFTP",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG"),
	"period", 	120,
	"active", 	false,
	"latestonly",	false,
);


#
# DLF Module
#

"/system/monitoring/metric/_6258" = nlist(
        "name", 	"DLFErrors",
        "descr", 	"returns pointer to array for top 5 errors in last hour",
        "class", 	"Castor2.DLFErrors",
        "param", 	list("fname", "/etc/castor/DLFCONFIG", "count","5"),
        "period", 	600,
        "active", 	false,
        "latestonly", 	false,
);

#from Misc

"/system/monitoring/metric/_6257" = nlist(
	"name", 	"OrphanTape",
	"descr", 	"returns 0, -1 or ids of orphaned processes ",
	"param", 	list("cluster", ""),
	"class", 	"Castor2.OrphanTape",
	"period", 	600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6523" = nlist(
        "name",         "MigHunterCheck",
        "descr",        "Check of MigHunter Processes",
        "class",        "system.numberOfProcesses",
        "param",        list("cmdregex", "/usr/bin/MigHunter .*-d.*", "uid", "0"),
        "period",       60,
        "active",       false,
        "latestonly",   false,
);############################################################
#
#from StagerDB
#


"/system/monitoring/metric/_6276" = nlist(
        "name",         "tablesize",
        "descr",        "returns the size of various castor2 tables",
        "class",        "Castor2.TableSize",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_tablesize"),
        "period",       86400,
        "active",       false,
        "latestonly",   false,
);"/system/monitoring/metric/_6528" = nlist(
        "name",         "DiskServerStatus",
        "descr",        "queries stager for info about file and their states on each diskserver",
        "class",        "Castor2.DiskServerStatus",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_DiskServerStat"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6264" = nlist(
        "name",         "AccessCountDist",
        "descr",        "Histogram of file access distribution",
        "class",        "Castor2.AccessCountDist",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_accesscount",
			     "items", "1"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6265" = nlist(
        "name",         "FileSizeDist",
        "descr",        "Histogram of file size distribution",
        "class",        "Castor2.FileSizeDist",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_filesize",
			     "items", "2"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6269" = nlist(
        "name",         "FileAgeDist",
        "descr",        "Histogram of file age distribution",
        "class",        "Castor2.FileAgeDist",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table","monitoring_fileage", 
                             "items", "1"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6266" = nlist(
        "name",         "MigLogSvc",
        "descr",        "returns files/sec and transfer/sec",
        "class",        "Castor2.MigLogSvc",
        "param",        list("fname", "/etc/castor/DLFCONFIG"),
        "period",       300,
        "active",       false,
        "latestonly",   false,
);
"/system/monitoring/metric/_6267" = nlist(
        "name",         "MigLogPool",
        "descr",        "returns files/sec and transfer/sec",
        "class",        "Castor2.MigLogPool",
        "param",        list("fname", "/etc/castor/DLFCONFIG"),
        "period",       300,
        "active",       false,
        "latestonly",   false,
);
"/system/monitoring/metric/_6268" = nlist(
        "name",         "MigLogAll",
        "descr",        "returns svcclass name, pool name, files/sec and transfer/sec",
        "class",        "Castor2.MigLogAll",
        "param",        list("fname", "/etc/castor/DLFCONFIG"),
        "period",       300,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6270" = nlist(
        "name",         "MetaRecall",
        "descr",        "Info about pending Castor2 Recalls",
        "class",        "Castor2.MetaRecall",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", "count", "4", "table", "monitoring_metarecallrunning"),
        "period",       900,
        "active",       false,
        "latestonly",   false,
);
"/system/monitoring/metric/_6247" = nlist(
        "name",         "MetaMigPending",
        "descr",        "Info about pending Castor2 Migrations",
        "class",        "Castor2.MetaMigPending",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_metamigpending"),
        "period",       900,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6248" = nlist(
        "name",         "MetaMigSelected",
        "descr",        "Info about selected Castor2 Migrations",
        "class",        "Castor2.MetaMigSelected",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_metamigselected"),
        "period",       900,
        "active",       false,
        "latestonly",   false,
); 

"/system/monitoring/metric/_6240" = nlist(
	"name", 	"Segment",
	"descr", 	"returns segment status on the castor stager",
	"class", 	"Castor2.Segment",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_segment"),
	"period", 	600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6241" = nlist(
	"name", 	"Stream",
	"descr", 	"returns stream status on the castor stager",
	"class", 	"Castor2.Stream",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG",
 			     "table", "monitoring_stream"),
	"period", 	600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6242" = nlist(
	"name", 	"SubRequest",
	"descr", 	"returns subrequests status on the castor stager",
	"class", 	"Castor2.SubRequest",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_subrequest"),
	"period", 	3600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6243" = nlist(
	"name", 	"TapeCopy",
	"descr", 	"returns tapecopy status on the castor stager",
	"class", 	"Castor2.TapeCopy",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_tapecopy"),
	"period", 	600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6244" = nlist(
	"name", 	"Tape",
	"descr", 	"returns tape status on the castor stager",
	"class", 	"Castor2.Tape",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_tape"),
	"period", 	1600,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6249" = nlist(
	"name", 	"VeryOldFiles",
	"descr", 	"returns number of files older than 30 days",
	"class", 	"Castor2.VeryOldFiles",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG",
			     "table", "monitoring_veryoldfiles"),
	"period", 	86400,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6253" = nlist(
	"name", 	"DiskCopy",
	"descr", 	"returns disk copy status on the castor stager",
	"class", 	"Castor2.DiskCopy",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_diskcopy"),
	"period", 	3200,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6271" = nlist(
	"name", 	"OldStageOut",
	"descr", 	"returns count of stageout files over 10 days old",
	"class", 	"Castor2.OldStageOut",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_stageout",),
	"period", 	86400,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6274" = nlist(
	"name", 	"WaitTapeRecall",
	"descr", 	"returns count of waittaperecall files over 2 days old",
	"class", 	"Castor2.WaitTapeRecall",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_waittaperecall",),
	"period", 	86400,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6275" = nlist(
	"name", 	"OldWaitDisk2DiskCopy",
	"descr", 	"returns count of OldWaitDisk2DiskCopy files over 2 days old",
	"class", 	"Castor2.OldWaitDisk2DiskCopy",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG", 
			     "table", "monitoring_waitdisk2diskcopy",),
	"period", 	86400,
	"active", 	false,
	"latestonly",	false,
);

##########################################
#
#from Stall
#

"/system/monitoring/metric/_6255" = nlist(
	"name", 	"MigStall",
	"descr", 	"returns pointer to array for number of files per pool in Recall state for >6hours",
	"class", 	"Castor2.Stall",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG", 
                             "stager_name", "", 
                             "olderthan", "6", 
                             "statusID", "10"),
	"period", 	3600,
	"active", 	false,
	"latestonly",	false,
); 

"/system/monitoring/metric/_6256" = nlist(
	"name",       "RecallStall",
	"descr",      "returns pointer to array for number of files per pool in Recall state for >6hours",
	"class",      "Castor2.Stall",
	"param", 	  list("fname",       "/etc/castor/ORAMONCONFIG", 
                       "stager_name", "", 
                       "olderthan",   "6",
                       "statusID",    "2"),
	"period", 	  3600,
	"active", 	  false,
	"latestonly", false,
); 

############################################################
### From DLF

"/system/monitoring/metric/_6254" = nlist(
	"name", 	"DiskpoolInfo",
	"descr", 	"returns diskpool general information",
	"class", 	"Castor2.DiskpoolInfo",
	"param", 	list("fname", "/etc/castor/ORAMONCONFIG",
			     "stager_name", ""),
	"period", 	10800,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6245" = nlist(
	"name", 	"Job",
	"descr", 	"returns CASTOR2 Job information - multivalued metric",
	"class", 	"Castor2.Job",
	"param", 	list("fname", "/etc/castor/DLFCONFIG", "table", "dlf_jobstats"),
	"period", 	300,
	"active", 	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6246" = nlist(
	"name", 	"Request",
	"descr", 	"returns CASTOR2 Requests information - multivalued metric",
	"class", 	"Castor2.Request",
	"param", 	list("fname", "/etc/castor/DLFCONFIG", "table", "dlf_reqstats"),
	"period", 	300,
	"active", 	false,
	"latestonly",	false,
);

############################################################
#
# from LSF
#

"/system/monitoring/metric/_6272" = nlist(
        "name",         "Probe",
        "descr",        "Timings and error info from probe per svcclass",
        "class",        "Castor2.Probe",
	"param", 	list("fname", "/etc/castor/ORASTAGERCONFIG", 
                             "path", "/tmp/c2probe.stat"),
        "period",       14400,
        "active",       false,
        "latestonly",   false,
); 

"/system/monitoring/metric/_6273" = nlist(
        "name",         "NSLSLatency",
        "descr",        "Info about nsls query time",
        "class",        "Castor2.NSLSLatency",
	"param", 	list("path", ""),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
); 

"/system/monitoring/metric/_6250" = nlist(
        "name",         "OldJobsPending",
        "descr",        "Number of old jobs",
        "class",        "Castor2.OldJobsPending",
        "param",        list("hours", "1"),
        "period",       3600,
        "active",       false,
        "latestonly",   false,
);

"/system/monitoring/metric/_6259" = nlist(
        "name",         "JobsPending",
        "descr",        "LSF Queue size",
        "class",        "Castor2.JobsPending",
        "param",        list("fname", "/etc/castor/ORAMONCONFIG"), 
        "period",       120,
        "active",       false,
        "latestonly",   false,
);