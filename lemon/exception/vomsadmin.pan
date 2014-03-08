template monitoring/lemon/exception/vomsadmin;


"/system/monitoring/exception/_30071" = nlist(
	"name",		"voms-admin_inconsistent_database_exception",
	"descr",	"Inconsistency in VOMS DB",
	"active",	true,
	"importance",	1,
	"latestonly",	false,
	"alarmtext",	"Inconsistency found in the voms-admin DB",
	"correlation",	"5220:1 > 0 || 5221:1 > 0 || 5222:1 > 0 || 5223:1 > 0 || 5224:1 > 0"
);


"/system/monitoring/exception/_30131" = nlist(
	"name", 	"tomcat_outofmemory_exception",
	"descr",	"Tomcat hangs due to memory problems",
	"active",	true,
	"importance",	1,
	"latestonly",	false,
	"alarmtext",	"OutOfMemory error found in tomcat log",
	"correlation",	"5225:1 > 0"
);

