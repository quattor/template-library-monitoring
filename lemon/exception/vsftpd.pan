template monitoring/lemon/exception/vsftpd;


"/system/monitoring/exception/_30039"=nlist(
	"name",      	"vsftpd_wrong",
	"descr",     	"vsftpd FTP daemon not running",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"vsftpd_wrong",
	"correlation",	"26:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service vsftpd start",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  true)
);

