############################################################
#
# template monitoring/lemon/metric/hw
#
############################################################

template monitoring/lemon/metric/hw;

"/system/monitoring/metric/_4111" = nlist(
	"name",      	"NumberOfCpus",
	"descr",     	"the number of processors",
	"class",     	"system.CPUCount",
	"period",    	86400,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 864000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5133" = nlist(
	"name",      	"Ext2FsWarning",
	"descr",     	"EXT-fs error",
	"class",     	"log.Parse",
    	"param",     	list("istring", " EXT(2|3)-fs (error|warning)",
			     "estring", "EXT(2|3)-fs warning: checktime reached, running e2fsck is recommended",
			     "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly", 	false,
);"/system/monitoring/metric/_5125" = nlist(
	"name",      	"UncorrectableError",
	"descr",     	"\"UncorrectableError\" reported in /var/log/messages?!",
	"class",     	"log.Parse",
   	"param",     	list("istring", "drive_cmd.*Error", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",   	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);# disabled by Dennis Waldron (23/04/06)
#   - sensor no longer deployed and metric is not active
#"/system/monitoring/metric/_5126" = nlist(
#	"name",      	"NodeTemperature",
#	"descr",     	"minimum and maximum temperatures as measured by LMsensors",
#	"class",     	"Enhanced::NodeTemperature",
#	"period",    	600,
#	"active",    	false, # XXX still useful? JvE
#	"latestonly",	false,
#);

"/system/monitoring/metric/_5127" = nlist(
	"name",      	"MachineCheckException",
	"descr",     	"Are there Machine Check Exception reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring", "Machine Check Exception", "sinceboot", "yes"),
	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5130" = nlist(
	"name",      	"IO_error",
	"descr",     	"Are there I/O errors reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",    	list("istring", "kernel: (end_request:|) +I/O error[:,] dev 0[38]", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5131" = nlist(
	"name",      	"FileSystem_error",
	"descr",     	"Are there filesystem errors (Ext2, Ext3, XFS) reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring", "xfs_force_shutdown", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_6309" = nlist(
	"name",      	"NMI",
	"descr",     	"Non-maskable interrupt",
	"class",     	"log.Parse",
    	"param",     	list("istring", "Dazed and confused", "sincelast", "6h"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);