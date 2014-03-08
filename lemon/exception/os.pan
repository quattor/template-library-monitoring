template monitoring/lemon/exception/os;


"/system/monitoring/exception/_30081" = nlist(
	"name",      	"Operating_System",
	"descr",     	"version of OS wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
	"correlation",	"4109:2 ne 'symlink('/system/kernel/version')'"
);


