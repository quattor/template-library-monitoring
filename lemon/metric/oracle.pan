#
# monitoring/lemon/metric/oracle
#
# This file contains the default metrics for the oracle sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-1
#    - Requires: lemon-sensor-oracle        >= 1.0-11
#
template monitoring/lemon/metric/oracle;

"/system/monitoring/metric/_4201" = nlist(
	"name",      	"/ORA/dbs00.use",
	"descr",     	"the occupancy of /ORA/dbs00 filesystem",
	"class",     	"file.filesystemUse",
	"param",     	list("filesystem", "/ORA/dbs00"),
	"period",    	3600,
	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_4202" = nlist(
	"name",      	"/ORA/dbs01.use",
	"descr",     	"the occupancy of /ORA/dbs01 filesystem",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem", "/ORA/dbs01"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_4203" = nlist(
	"name",      	"/ORA/dbs02.use",
	"descr",     	"the occupancy of /ORA/dbs02 filesystem",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem", "/ORA/dbs02"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_4204" = nlist(
	"name",      	"/ORA/dbs03.use",
	"descr",     	"the occupancy of /ORA/dbs03 filesystem",
	"class",     	"file.filesystemUse",
    	"param",     	list("filesystem", "/ORA/dbs03"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 3.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);


# End-of-File
