# 
# monitoring/lemon/metric/file
#
# This file contains the default metrics for the file sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#
template monitoring/lemon/metric/file;


"/system/monitoring/metric/_20012" = nlist(
	"name",      	"/tmp.use",
	"descr",     	"Occupancy of \"/tmp\" filesystem [%]",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem", "/tmp"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);
"/system/monitoring/metric/_20015" = nlist(
        "name",         "/home.use",
        "descr",        "Occupancy of \"/home\" filesystem [%]",
        "class",        "file.filesystemUse",
        "param",        list("filesystem", "/home"),
        "period",       300,
        "smooth",       nlist("typeString", false, "maxdiff", 3.0, "maxtime", 3600),
        "active",       true,
        "latestonly",   false,
);

"/system/monitoring/metric/_20022" = nlist(
	"name",      	"/var.use",
	"descr",     	"Occupancy of \"/var\" filesystem [%]",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem", "/var"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_20042" = nlist(
	"name",      	"/root.use",
	"descr",     	"Occupancy of \"/root\" filesystem [%]",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem","/"),
	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 3600),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_20044" = nlist(
	"name",      	"CrashDump",
	"descr",     	"Are there crash dumps on the system?",
	"class",     	"file.filecount",
	"param",     	list("dir", "/var/log/dump"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0,"maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);


# End-of-File
