template monitoring/lemon/exception/plcQuery;


"/system/monitoring/exception/_33010" = nlist(
	"name",       	"power_location_overloaded",
	"descr",       	"Power location is more then 90% loaded",
	"active",      	true,
	"latestonly",  	false,
	"importance",  	1,
	"correlation",  "CRITICAL:4322:2 > ((95 / 100) * 300)",
     	"actuator",    	nlist( 
                          	"execve",  "/bin/sh -c \\\\\" /bin/echo 'CRITICAL Power Location - Overloaded' | /bin/mail -s \\\\\\\"Power Location Alarm\\\\\\\" 41764870355@mail2sms.cern.ch \\\\\" ", 
                          	"maxruns", 1, 
                          	"timeout", 0, 
                          	"active",  true) 
);

