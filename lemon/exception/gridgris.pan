template monitoring/lemon/exception/gridgris;
 

"/system/monitoring/exception/_30133" = nlist(
	"name",      	"Gatekeeper_Status_Error",
	"descr",     	"Problem with GridGatekeeper status",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"GRID_GATEKEEPER_WRONG",
	"correlation",	"811:1 < 0",
        "actuator",     nlist("execve",  "/opt/glite/bin/edg-gatekeeper-restart.sh",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  false)
);


"/system/monitoring/exception/_30093" = nlist(
	"name",      	"GridGris_Status_Error",
	"descr",     	"Problem with GridGris status",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"GRID_GRIS_WRONG",
	"correlation",	"805:1 <= 0",
        "actuator",     nlist("execve",  "/etc/init.d/globus-mds restart",
                              "maxruns", 3,
                              "timeout", 0,
                              "active",  true)
);


