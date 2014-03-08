############################################################
#
# template monitoring/lemon/metric/hwscan
#   Implementation of the Hwscan sensors to compare the 
#   CDB and hardware definitions
#
############################################################

template monitoring/lemon/metric/hwscan;

"/system/monitoring/metric/_5106" = nlist(
	"name",      	"DiskDrives",
	"descr",     	"Return count of disk drives and space",
	"class",     	"hwscan.DiskDrives",
	"period",    	86400,
	"active",    	false,
	"latestonly",	false,
);
"/system/monitoring/metric/_5102" = nlist(
	"name",      	"ChkHwscan",
	"descr",     	"Difference between hardware configuration and CDB",
	"class",     	"hwscan.check",
	"period",    	86400,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);