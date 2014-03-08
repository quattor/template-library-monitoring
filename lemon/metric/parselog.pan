# 
# monitoring/lemon/metric/parselog
#
# This file contains the default metrics for the parse log sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/parselog;

"/system/monitoring/metric/_5121" = nlist(
	"name",      	"KernelPanic",
	"descr",     	"Has the kernel panicked?",
	"class",     	"log.Parse",
    	"param",     	list("istring", "(Unable to handle kernel paging request|kernel BUG at) ", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5122" = nlist(
	"name",      	"VM_kill",
	"descr",     	"Processes killed because of memory problems",
	"class",     	"log.Parse",
    	"param",     	list("istring", "(VM: killing process|Out of Memory: Killed process) ", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5125" = nlist(
	"name",      	"UncorrectableError",
	"descr",     	"\"UncorrectableError\" reported in /var/log/messages?!",
	"class",     	"log.Parse",
   	"param",     	list("istring", "drive_cmd.*Error", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5127" = nlist(
	"name",      	"MachineCheckException",
	"descr",     	"Are there Machine Check Exception reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring", "Machine Check Exception","sinceboot", "yes"),
	"period",    	3600,
   	"smooth",   	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",   	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5130" = nlist(
	"name",      	"IO_error",
	"descr",     	"Are there I/O errors reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring","kernel: (end_request:|) +I/O error[:,] dev 0[38]", "sinceboot","yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_5131" = nlist(
	"name",      	"FileSystem_error",
	"descr",     	"Are there filesystem errors (Ext2, Ext3, XFS) reported in /var/log/messages?",
	"class",     	"log.Parse",
    	"param",     	list("istring", "xfs_force_shutdown", "sinceboot", "yes"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);


# End-of-File
