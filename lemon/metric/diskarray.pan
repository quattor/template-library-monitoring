############################################################
#
# template monitoring/lemon/metric/diskarray
#
############################################################

template monitoring/lemon/metric/diskarray;

"/system/monitoring/metric/_6331" = nlist(
    	"name",      	"diskArray.pipe",
    	"descr",     	"link between edg-fmon-agent and sensor-disk-array",
    	"class",     	"file.dump",
     	"param",     	list("file", "/var/run/diskArray.pipe",
                       		"multitype","1"),
    	"period",    	0,
    	"active",    	true,
    	"latestonly",	true,
);

"/system/monitoring/metric/_6332" = nlist(
    	"name",     	"iftCtlrEventTrapAlert",
    	"descr",     	"returns infortrend diskarrays Alerts",
    	"class",     	"iftCtlrEventTrapAlert",
    	"period",    	0, # never previously defined
    	"active",    	true,
    	"latestonly",	false,
);

"/system/monitoring/metric/_6333" = nlist(
    	"name",      	"iftCtlrEventTrapWarning",
    	"descr",     	"returns infortrend diskarrays warnings",
    	"class",     	"iftCtlrEventTrapWarning",
    	"period",    	0, # never previously defined
   	"active",    	true,
   	"latestonly",	false,
);

"/system/monitoring/metric/_6334" = nlist(
   	"name",      	"iftCtlrEventTrapNotification",
    	"descr",     	"returns infortrend diskarrays notifications",
    	"class",     	"iftCtlrEventTrapNotification",
    	"period",    	0, # never previously defined
    	"active",    	true,
    	"latestonly",	false,
);

 
"/system/monitoring/metric/_6335" = nlist(
    	"name",      	"diskArrayHeartbeat",
    	"descr",    	"returns infortrend diskarrays notifications",
    	"class",     	"DiskArrayHeartBeat::getHeartBeat",
    	"param",     	list("agents","",
                      		"community", "public",
                      		"oid","serialNum"),
    	"period",   	300,
    	"active",    	true,
    	"latestonly",	false,
);
