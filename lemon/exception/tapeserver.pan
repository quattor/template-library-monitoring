template monitoring/lemon/exception/tapeserver;


"/system/monitoring/exception/_30037" = nlist(
	"name",      	"tpdaemon_wrong",
	"descr",     	"tp tapeserver daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"tpdaemon_wrong",
	"correlation",	"6203:1 != 1",
	"actuator", 	nlist("execve",  "/sbin/service tpdaemon start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);




"/system/monitoring/exception/_30038" = nlist(
	"name",      	"rtcpd_wrong",
	"descr",     	"rtcpd daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"rtcpd_wrong",
	"correlation",	"6204:1 != 1",
	"actuator", 	nlist("execve",  "/sbin/service rtcpd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);


#"/system/monitoring/exception/_30507" = nlist(
#	"name",      	"cable_unplugged",
#	"descr",     	"Cable is unplugged message in /var/log/messages, last hour",
#	"active",    	true,
#	"latestonly",	false,
#	"importance", 	3,
#	"correlation",	"6214:1 != 0"
#);


# Commented out as this is not currently needed for production - Vlado Bahyl - January 2006
#"/system/monitoring/metric/_6216" = nlist(
#       "name",      	"TapeDriveConsistency",
#       "descr",     	"check consistency between contents of /etc/TPCONFIG and `mt -f /dev/nst* status`",
#       "class",     	"Castor::ChkDriveConsistency",
#       "period",    	3600,
#       "smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
#       "active",    	false,
#       "latestonly",	true,
#);	

# Commented out as this is not currently needed for production - Vlado Bahyl - January 2006
#"/system/monitoring/exception/_30323" = nlist(
#      "name",         	"tpdrive_awol",
#      "descr",        	"inconsistent tapedrive status",
#      "active",       	false,
#      "latestonly",   	true,
#      "importance",   	3,
#      "alarmtext", 	"tpdrive_awol",
#      "correlation",	"6216:1 != 0"
#);

#
# Tape Drive not Operational check
#
"/system/monitoring/metric/_6600" = nlist(
	"name",        "TapeDriveNotOperational",
	"descr",       "Tape Drive not Operational",
	"class",       "log.Parse",
	"period",      180,
	"smooth",      nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",      true,
	"latestonly",  true,
	"param", 	list(
			"logfile",   "/var/spool/tape/log",
			"dformat",   "%m/%d %T",
#			"istring",   'tpdaemon: TP\w+ - configuring \w+ down',
			"istring",   'not operational',
			"sincelast", "5m"),
);


"/system/monitoring/exception/_30350"=nlist(
	"name",        "TapeDriveNotOperational",
	"descr",       "Tape Drive not Operational",
	"active",      true,
	"latestonly",  false,
	"importance",  2,
	"correlation", "6600:1 > 0",
	"actuator", nlist(
		"execve", '/usr/local/sbin/tdms-report-problem --logfile /var/spool/tape/log --code TapeDrive001E --debug',
		"maxruns", 1,
		"timeout", 600,
		"active", true)
);




"/system/monitoring/exception/_30351"=nlist(
	"name",        "TapeMediaWriteProtected",
	"descr",       "Tape Media Write Protected",
	"active",      true,
	"latestonly",  false,
	"importance",  2,
	"correlation", "6601:1 > 0",
	"actuator", nlist(
		"execve", '/usr/local/sbin/tdms-report-problem --logfile /var/spool/tape/log --code TapeMedia001E --debug',
		"maxruns", 1,
		"timeout", 600,
		"active", true)
);




"/system/monitoring/exception/_30352"=nlist(
	"name",        "TapeMediaBadMIR",
	"descr",       "Tape Media bad MIR repair failed",
	"active",      true,
	"latestonly",  false,
	"importance",  2,
	"correlation", "6602:1 > 0",
	"actuator", nlist(
		"execve", '/usr/local/sbin/tdms-report-problem --logfile /var/spool/tape/log --code TapeMedia002E --debug',
		"maxruns", 1,
		"timeout", 600,
		"active", true)
);




"/system/monitoring/exception/_30353" = nlist(
	"name",        "TapeRequestStuck",
	"descr",       "Tape Request Stuck",
	"active",      true,
	"latestonly",  false,
	"importance",  2,
	"correlation", "(6204:1 == 1) && (6603:1 > 1) && (6604:1 > 3600)",
	"actuator", nlist(
		"execve", '/usr/local/sbin/tdms-report-problem --logfile /var/spool/rtcopy/rtcopyd.log --code TapeDrive002E --debug',
		"maxruns", 1,
		"timeout", 1200,
		"active", true)
);




"/system/monitoring/exception/_30365" = nlist(
	"name",		"TapeDaemonFailureMailer",
	"descr",	"Tape Daemon Failure Mailer",
	"active",	true,
	"latestonly",	false,
	"importance",	2,
	"local",	true,
	"correlation",	"(6617:1 > 0)",
	"actuator",	nlist(
		"execve",	'/bin/sh -c \\"/usr/local/sbin/tpmaint --nowait --stop > /dev/null 2>&1 ; /usr/bin/tac /var/spool/tape/log | /bin/egrep -m 1 -A 30 -B 10 \\\"(NI_FAILURE)\\\" | /usr/bin/tac | /bin/mail -s \\\"Tape Daemon Failure\\\" tape-operations@cern.ch \\"',
		"maxruns",	1,
		"timeout",	600,
		"active",	true)
);

