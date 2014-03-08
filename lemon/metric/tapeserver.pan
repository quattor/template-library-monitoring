############################################################
#
# template monitoring/lemon/metric/tapeserver
#
############################################################

template monitoring/lemon/metric/tapeserver;

"/system/monitoring/metric/_6203" = nlist(
	"name",      	"tpdaemon",
	"descr",     	"\"tpdaemon\" tapeserver daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "tpdaemon", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_6204" = nlist(
	"name",      	"rtcpd main process",
	"descr",     	"\"rtcpd\" main process",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "rtcpd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_6211" = nlist(
	"name",      	"Castor::MirStatus",
	"descr",     	"the number of \"MIR is valid\" and \"MIR is invalid\" messages recorded in the last hour",
	"class",     	"Castor::MirStatus",
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6212" = nlist(
	"name",      	"Castor::MountCount",
	"descr",     	"the number of mounted and dismounted tapes in the last hour",
	"class",     	"Castor::MountCount",
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
);

# Commented out as this is not currently needed for production - Vlado Bahyl - January 2006
#"/system/monitoring/metric/_6214" = nlist(
#	"name",      	"Castor::ChkCableUnplugged",
#	"descr",     	"check for \"Cable is unplugged\" in /var/log/messages, in the last hour",
#	"class",     	"Castor::ChkCableUnplugged",
#	"period",    	3600,
#    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
#	"active",    	true,
#	"latestonly",	false,
#);

##
# Tape Write Protected check
#
"/system/monitoring/metric/_6601" = nlist(
	"name",        "TapeMediaWriteProtected",
	"descr",       "Tape Media Write Protected",
	"class",       "log.Parse",
	"period",      300,
	"smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",      true,
	"latestonly",  true,
	"param", list(
		"logfile",   "/var/spool/tape/log",
		"dformat",   "%m/%d %T",
		"istring",   "failed : write protected",
		"sincelast", "10m"),
);#
# Tape Bad MIR check
#
"/system/monitoring/metric/_6602" = nlist(
	"name",        "TapeMediaBadMIR",
	"descr",       "Tape Media bad MIR repair failed",
	"class",       "log.Parse",
	"period",      300,
	"smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",      true,
	"latestonly",  true,
	"param", list(
		"logfile",   "/var/spool/tape/log",
		"dformat",   "%m/%d %T",
		"istring",   "Bad MIR repair=failed",
		"sincelast", "10m"),
);#
# Request stuck check
#
"/system/monitoring/metric/_6603" = nlist(
        "name",         "rtcpd user process",
        "descr",        "\"rtcpd\" user process",
        "class",        "system.numberOfProcesses",
        "param",        list("name", "rtcpd"),
        "period",       600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
        "active",       true,
        "latestonly",   true,
);

"/system/monitoring/metric/_6604" = nlist(
        "name",         "rtcpd log age",
        "descr",        "\"rtcpd\" log file age",
        "class",        "file.sslmtime",
        "param",        list("file", "/var/spool/rtcopy/rtcopyd.log"),
        "period",       550,
        "offset",       "510",
        "active",       true,
        "latestonly",   true,
);#
# Failure of the tape daemon: NI_FAILURE, long timeouts
# - list of errors (in istring field) will grow/shrink as we discover/fix them
#
"/system/monitoring/metric/_6617" = nlist(
	"name",		"TapeDaemonFailureCheck",
	"descr",	"Tape Daemon Failure Check",
	"class",	"log.Parse",
	"period",	180,
	"smooth",	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",	true,
	"latestonly",	true,
	"local",	true,
	"param",        list(
		"logfile",	"/var/spool/tape/log",
		"dformat",	"%m/%d %T",
		"istring",	'(?i)(NI_FAILURE)',
		"sincelast",	"5m"),
);