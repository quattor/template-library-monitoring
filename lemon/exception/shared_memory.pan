template monitoring/lemon/exception/shared_memory;


"/system/monitoring/exception/_30080" = nlist(
	"name",      	"shared_memory",
	"descr",     	"size of the shared memory wrong",
	"active",    	false,
	"latestonly",	false,
	"importance", 	1,
	"correlation",	"4102:1 ne 'symlink('/software/components/sysctl/kernelDOTshmmax')'"
);


