############################################################
#
# template monitoring/lemon/metric/gridlfc
#
############################################################

template monitoring/lemon/metric/gridlfc;

"/system/monitoring/metric/_39" = nlist(
	"name",      	"lfcdaemon",
	"descr",     	"lfc daemon running processes",
	"class",     	"system.numberOfProcesses",
	"param",     	list("name", "lfcdaemon", "uid", "17700", "ppid", "1"),
  	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_42" = nlist(
	"name",      	"lfc_dli_daemon",
	"descr",     	"lfc_dli daemon running processes",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "lfc-dli", "uid", "17700", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_5201" = nlist(
	"name",      	"Lfc_log_db_check",
	"descr",     	"LFC DB log file check for ORA-",
	"class",     	"log.Parse",
    	"param",     	list("logfile", "/var/log/lfc/log",
		      	     "dformat", "%m/%d %T",
		      	     "istring", "ORA-(?!(02396|03113|12547|12514|03114))",
		      	     "sincelast", "30m"),
	"period",    	1800,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_5202" = nlist(
	"name",      	"lfc_readentry",
	"descr",     	"Check we can do a stat on a LFC file",
	"class",     	"lfc.readEntry",
#    	"param",     	list("dir", "/grid/ops"),
	"period",    	300,
    	#"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_5203" = nlist(
	"name",      	"lfc_writeentry",
	"descr",     	"Check we can write a directory in the catalog",
	"class",     	"lfc.writeEntry",
#    	"param",     	list("dir", "/grid/ops"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_5204" = nlist(
	"name",      	"lfc_time_readdir",
	"descr",     	"Find how long it takes to do a readdir",
	"class",     	"lfc.timeReaddir",
#    	"param",     	list("dir", "/grid/ops"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_5205" = nlist(
	"name",      	"lfc_activeConnections",
	"descr",     	"Count number of active TCP connections to the LFC",
	"class",     	"lfc.activeConnections",
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_5206" = nlist(
	"name",      	"lfc_totalCount",
	"descr",     	"Total Number of Operations",
	"class",    	"log.Parse",
    "param",        list("logfile", "/var/log/lfc/log",
		      	         "dformat", "%m/%d %T",
		      	         "istring", "NS098 -",
		      	         "sincelast", "5m"),
	"period",    	300,
    "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_5207" = nlist(
	"name",      	"lfc_readCount",
	"descr",     	"Number of Write operations",
	"class",     	"log.Parse",
    "param",        list("logfile", "/var/log/lfc/log",
		      	         "dformat", "%m/%d %T",
		      	         "istring", "NS098 - (opendir|read|list|l?stat)",
		      	         "sincelast", "5m"),
	"period",    	300,
    "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_5208" = nlist(
	"name",      	"lfc_delCount",
	"descr",     	"Number of Delete operations",
	"class",     	"log.Parse",
    "param",        list("logfile", "/var/log/lfc/log",
                         "dformat", "%m/%d %T",
                         "istring", "NS098 - (delreplica|rmdir|unlink)",
                         "sincelast", "5m"),
	"period",    	300,
    "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_5209" = nlist(
	"name",      	"lfc_writeCount",
	"descr",    	 "Number of Write operations",
	"class",     	"log.Parse",
    "param",        list("logfile", "/var/log/lfc/log",
                         "dformat", "%m/%d %T",
                         "istring", "NS098 - (creat|mkdir|setfsizeg|symlink|addreplica)",
                         "sincelast", "5m"),
	"period",    	300,
    "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);

#
# JC - This alarm is only an aggregate for the lbclient system, and should
# not be raised to the operator, so it's local only
#