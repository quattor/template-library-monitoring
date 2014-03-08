template monitoring/lemon/exception/lsf;


"/system/monitoring/exception/_30601" = nlist(
	"name",      	"limd_wrong",
	"descr",     	"LSF lim daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"lim_wrong",
	"correlation",	"4005:1 !range '1-2'",
	"actuator", 	nlist("execve", "/sbin/service lsf start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active", true)
);




"/system/monitoring/exception/_30602" = nlist(
	"name",      	"sbatchd_wrong",
	"descr",     	"LSF sbatch daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance",	3,
	"alarmtext",	"sbatchd_wrong",
	"correlation",	"4007:1 !range '1-9'",
	"actuator", 	nlist("execve",  "/sbin/service lsf start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);




"/system/monitoring/exception/_30603" = nlist(
	"name",      	"res_wrong",
	"descr",     	"LSF res daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"res_wrong",
	"correlation",	"4009:1 !range '1-20'",
	"actuator", 	nlist("execve",  "/sbin/service lsf start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);





"/system/monitoring/exception/_30604" = nlist(
	"name",      	"old_shutdowntime",
	"descr",     	"old shutdown time",
	"active",    	false,
	"latestonly",	false,
	"importance", 	1,
	"alarmtext", 	"old_shutdowntime",
	"correlation", 	"5012:1 != 0"
);




"/system/monitoring/exception/_30605" = nlist(
	"name",      	"pool_full",
	"descr",     	"occupancy of pool partition",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"pool_full",
	"correlation",	"((9104:1 eq '/pool') && (9104:5 > 95))",
	"actuator", 	nlist("execve",  "/usr/local/lsf/etc/PoolFull.pl",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);


"/system/monitoring/exception/_30078" = nlist(
	"name",      	"pool.quota",
	"descr",     	"no user quota on /pool",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"pool_quota",
	"correlation",	"((9104:1 eq '/pool') && (9104:7 != 1))"
);

