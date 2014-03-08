############################################################
#
# template monitoring/lemon/metric/gridftp
#
############################################################

template monitoring/lemon/metric/gridftp;

#
#  LCG-MON-GRIDFTP
#
"/system/monitoring/metric/_30" = nlist(
    	"name",      	"lcg-mon-gridftp",
    	"descr",     	"lcg-mon-gridftp daemon running processes",
    	"class",     	"system.numberOfProcesses",
        "param",        list("name", "lcg-mon-logfile-daemon.py lcg-mon-logfile lcg-mon-gridftp", "uid", "2", "ppid", "1"),
    	"period",    	300,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3600),
    	"active",    	false,
    	"latestonly",	false,
);	

variable refmetric = "30";#
# Gridview Gridftp Publisher Daemon
#
"/system/monitoring/metric/_27" = nlist(
        "name",         "Gridview-Gridftp-Publisher",
        "descr",        "Gridview Gridftp Publisher Daemon daemon running processes",
        "class",        "system.numberOfProcesses",
        "param",        list("cmdline", "/usr/bin/perl /opt/gridview/sbin/gridview-gridftp-wsclient.pl", "uid", "2", "ppid", "1"),
        "period",       300,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 3600),
        "active",       false,
        "latestonly",   false,
);#
#  GRIDFTP
#
"/system/monitoring/metric/_34" = nlist(
    	"name",      	"gridftp",
    	"descr",     	"gridftp daemons running",
    	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "in.ftpd", "uid", "0", "ppid", "1", "gid", "0"),
    	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
    	"active",    	false,
    	"latestonly",	false,
);

variable refmetric = "34";
