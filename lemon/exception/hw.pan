template monitoring/lemon/exception/hw;


"/system/monitoring/exception/_30501" = nlist(
	"name",      	"cpu_wrong",
	"descr",     	"Cpu dead",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
	"alarmtext", 	"cpu_wrong",
	"correlation",	"4115:6 != symlink('/hardware/cpucount')"
);




"/system/monitoring/exception/_30004" = nlist(
	"name",      	"extfs_warning",
	"descr",     	"ext filesystem warning",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
    	"alarmtext", 	"ExtFsWarning",
	"correlation",	"5133:1 != 0"
);




"/system/monitoring/exception/_30502" = nlist(
	"name",      	"uncorrectable_error",
	"descr",     	"uncorrectable errors in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"UncorrectableError",
	"correlation",	"5125:1 != 0"
);




"/system/monitoring/exception/_30503" = nlist(
	"name",      	"machine_exception",
	"descr",     	"Machine Check Exception reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"MachineCheckException",
	"correlation",	"5127:1 != 0"
);




"/system/monitoring/exception/_30504" = nlist(
	"name",      	"io_error",
	"descr",     	"I/O errors reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
    	"alarmtext", 	"IO_ERROR",
	"importance", 	2,
	"correlation",	"5130:1 != 0"
);





"/system/monitoring/exception/_30505" = nlist(
	"name",      	"filesystem_error",
	"descr",     	"Filesystem errors reported in /var/log/messages",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"FILESYSTEM_ERROR",
	"correlation",	"5131:1 != 0"
);




"/system/monitoring/exception/_30079" = nlist(
	"name",      	"nmi_received",
	"descr",     	"non-maskable interrupt",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
    	"alarmtext", 	"NMI_RECEIVED",
	"correlation",	"6309:1 != 0"
);


"/system/monitoring/exception/_30003" = nlist(
	"name",      	"dma_disabled",
	"descr",     	"dma disabled on a disk",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
	"alarmtext", 	"DMA_disabled",
	"correlation",	"9104:6 == 0"
);


