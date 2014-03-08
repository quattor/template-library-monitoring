#
# monitoring/metric/afsvolumes
#
template monitoring/lemon/metric/afsvolumes;

# metrics
"/system/monitoring/metric/_905/" = nlist(
    	"name", 	"volumes",
    	"descr", 	"AFS Volumes Statistics",
   	"class", 	"afsvolumes.volumes",
    	"period", 	1200,
    	"active", 	true,
    	"latestonly",	false,
);
