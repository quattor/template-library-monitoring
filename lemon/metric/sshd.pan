############################################################
#
# template monitoring/lemon/metric/sshd
#
############################################################

template monitoring/lemon/metric/sshd;

"/system/monitoring/metric/_4006" = nlist(
	"name",      	"sshd",
	"descr",     	"\"sshd\" SSH daemon",
	"class",    	"system.numberOfProcesses",
    	"param",     	list("name", "sshd", "ppid", "1"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);