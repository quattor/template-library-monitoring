############################################################
#
# template monitoring/lemon/metric/tapeserver_smc
#
#  metrics specific to SCSI Media Changer - JvE / Jan 19, 2005
#
############################################################

template monitoring/lemon/metric/tapeserver_smc;

"/system/monitoring/metric/_6205" = nlist(
	"name",      	"rmcdaemon",
	"descr",     	"\"rmcdaemon\" tapeserver daemon",
	"class",     	"system.numberOfProcesses",
	"param",     	list("name","rmcdaemon","uid","0","ppid","1"),
	"period",    	60,
	"smooth",    	nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",   600),
	"active",    	false,
	"latestonly",	false,
);