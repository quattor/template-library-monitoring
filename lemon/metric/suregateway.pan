#
# monitoring/metric/suregateway
#
template monitoring/lemon/metric/suregateway;

"/system/monitoring/metric/_6004" = nlist(
	"name",       	"SureGateway",
	"descr",      	"SURE gateway into LEMON",
	"class",      	"suregateway.listener",
	"param",	list("port", "4241", "proto", "udp", 

			     # mapping between SURE alarmtext and LEMON exception id
			     "HEARTBEAT", 			"10005",	

			     # UIMON
			     "3DMD_FAIL",			"31000",
			     "CPU_EXCEEDED",			"31001",
			     "CPU_LOAD",			"31002",
			     "CVSUPD_FAIL",			"31003",
			     "CVSWEB_HTTPD_FAIL",		"31004",
			     "DETECTED_HARDWARE_ERRORS",	"31005",
			     "DISK_MIRRORING_HAS_FAILED",	"31006",
			     "FILESYSTEM_FAIL",			"31007",
			     "FILESYSTEM_LIMIT",		"31008",
			     "FILESYSTEM_MISSING",		"31009",
			     "FILESYSTEM_FULL",                 "31010",
			     "LCGCVSWEB_HTTPD_FAIL",            "31011",
			     "MEM_EXCEEDED",			"31012",
			     "MOUNT_ROOT_LIMIT",		"31013",
			     "NOTD_NOT_RUNNING",		"31014",
			     "PAGEFAULTS_EXCEEDED",		"31015",
			     "PROC_FRAMEMAKER_FAIL",		"31016",
			     "PROC_MATHLM_FAIL",		"31017",
			     "PROC_MATHLM_NEEDS_TO_BE_STOPPED", "31018",
			     "PROCESS_DSMC",			"31019",
			     "PROCESS_FAIL",			"31020",
			     "PROCESS_SNMPD",			"31021",
			     "PROCESS_SSHD",			"31022",
			     "PROCESS_TWIKI_HTTPD_FAIL",	"31023",
			     "PROCESS_XINETD",			"31024",
			     "PROCESSCOUNT",			"31025",
			     "SWAP_EXCEEDED",			"31026",
			     "_BOOT_FILESYSTEM_FULL",		"31027",
			     "_LOCAL_FILESYSTEM_FAIL",		"31028",
			     "_LOCAL_FILESYSTEM_FULL",		"31029",
			     "_ROOT_FILESYSTEM_FAIL",		"31030",
			     "_ROOT_FILESYSTEM_FULL",		"31031",
			     "_TMP_FILESYSTEM_FAIL",		"31032",
			     "_TMP_FILESYSTEM_FULL",		"31033",
			     "_USR_FILESYSTEM_FAIL",		"31034",
			     "_USR_FILESYSTEM_FULL",		"31035",
			     "_USR_FILESYSTEM_MISSING",		"31036",
			     "_VAR_FILESYSTEM_FAIL",		"31037",
			     "_VAR_FILESYSTEM_FULL",		"31038",
			     "_VAR_FILESYSTEM_MISSING",		"31039",

			     # AFS
			     "3WARE",				"31100",
			     "A1000",				"31101",
			     "ACCESS",				"31102",
			     "DISKFULL",			"31103",
			     "ERROR",				"31104",
			     "IBMRAID",				"31105",
			     "OFFLINE",				"31106",
			     "SALVAGE",				"31107",
			     "SWAPFULL",			"31108",
			     "UNKNOWN",				"31109",
			     "VOLSER",				"31110",
			     "WARNING",				"31111",
			     "A3000",				"31112",
			     "CHECKLOG",			"31113",
			     "LSICTRL",				"31114",
			     "GSSKLOGD",                        "31115",

			     # DISKARRAYS
			     "DISKARRAY_ALERT",			"31120",
			     "DISKARRAY_WARNING",		"31121"
			
			    ),
	"period",     	300,
    	"offset",     	"0",
	"active",     	true,
	"latestonly", 	false,
);

#
# UIMON exceptions
##
# AFS
##
# Disk Arrays
#