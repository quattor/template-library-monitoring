template monitoring/lemon/exception/xfs;


"/system/monitoring/exception/_30046" = nlist(
	"name",      	"xfs_wrong",
	"descr",     	"Xfs daemon wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"xfs_wrong",
	"correlation",	"4018:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service xfs start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);

