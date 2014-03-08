############################################################
#
# template monitoring/lemon/metric/vsftpd
#
############################################################

template monitoring/lemon/metric/vsftpd;

"/system/monitoring/metric/_26" = nlist(
	"name",      	"vsftpd",
	"descr",     	"the vsftpd FTP daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "vsftpd", "uid", "0", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);