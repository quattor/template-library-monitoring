#
# monitoring/metric/gridgris; 
#

template monitoring/lemon/metric/gridgris; 

"/system/monitoring/metric/_805" = nlist( 
   	"name", 	"GrisStatus", 
   	"descr", 	"returns <0 if Gris down, >=0 if Gris up", 
   	"class", 	"GridGris::GrisStatus", 
   	"period", 	120, 
   	"active", 	false, 
   	"latestonly",	false, 
); 

"/system/monitoring/metric/_806" = nlist( 
   	"name", 	"GrisLoad", 
   	"descr", 	"Returns a value for the current load on the GRIS", 
   	"class", 	"GridGris::GrisLoad", 
   	"period", 	120, 
   	"active", 	false, 
   	"latestonly",	false, 
); 

"/system/monitoring/metric/_811" = nlist( 
   	"name", 	"GrisGatekeeper", 
   	"descr", 	"returns <0 if Gris down, >=0 if Gatekeeper up", 
   	"class", 	"GridGris::GrisGatekeeper", 
   	"period", 	120, 
   	"active", 	false, 
   	"latestonly",	false, 
);