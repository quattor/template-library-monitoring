###########################################################
#
# template monitoring/lemon/metric/hwprobe
#   Check the status of the file server probe daemons
#
############################################################

template monitoring/lemon/metric/hwprobe;

"/system/monitoring/metric/_6052" = nlist(
	"name",      	"MemprobeStatus",
	"descr",     	"Status of last memprobe execution",
	"class",     	"hwprobe.memprobe",
	"period",    	43200,
   	"smooth",    	nlist("typeString", false, "index", 0, "maxdiff", 1.0, "maxtime", 6000),
	"active",	true,
	"latestonly",	false,
);

# 
# EDAC is generally reporting 0s.  Low frequency errors but I want to sample
# at a high rate to get precision
#
"/system/monitoring/metric/_6053" = nlist(
	"name",      	"EdacStatus",
	"descr",     	"Status of EDAC sampling for memory errors",
	"class",     	"hwprobe.edac",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 0, "maxdiff", 1.0, "maxtime", 864000),
	"active",	true,
	"latestonly",	false,
);

#
# SLC4 x86_64 only updates the /var/log/mcelog every 60 minutes so no
# benefit to sample in a shorter interval
#
"/system/monitoring/metric/_6054" = nlist(
	"name",      	"MceStatus",
	"descr",     	"Status of MCE sampling for machine checks",
	"class",     	"hwprobe.mce",
	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "index", 0, "maxdiff", 1.0, "maxtime", 864000),
	"active",	true,
	"latestonly",	false,
);

