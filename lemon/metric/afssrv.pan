#
# monitoring/metric/afssrv
#
template monitoring/lemon/metric/afssrv;

# metrics
"/system/monitoring/metric/_903/" = nlist(
    	"name", 	"srv",
    	"descr", 	"AFS Servers Statistics",
   	"class", 	"afssrv.srvcalls",
    	"period", 	300,
    	"active", 	true,
    	"latestonly",	false,
);
