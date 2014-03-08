############################################################
#
# template monitoring/lemon/metric/gridfts
#
############################################################

template monitoring/lemon/metric/gridfts;

# G. McCance 30/10/2006

# FTA wrong alarm
# FTA installs a script which checks all the configured agents are working as they
# should be. If not, it writes an alarm file. This metric and associated exception
# triggers on that file.
#
"/system/monitoring/metric/_850" = nlist(
	"name",      	"fta_wrong",
	"descr",     	"size of file \"/var/lib/fts-agent-alarm/fts-agent.alarm\"",
	"class",     	"file.size",
    	"param",    	list("file", "/var/lib/fts-agent-alarm/fts-agent.alarm"),
	"period",    	60,
	"offset",    	"120",
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 6000),
	"active",    	true,
	"latestonly",	false,
);# FTS stuck alarm
# FTS installs a script which checks that the FTS application running inside the tomcat daemon
# is responding correctly. If not, it writes an alarm file. This metric and associated exception
# triggers on that file.
# Compare TOMCAT_WRONG - which triggers if the tomcat container daemon itself is down.
#
"/system/monitoring/metric/_851" = nlist(
        "name",         "fts_stuck",
        "descr",        "size of file \"/var/lib/fts-stuck-alarm/fts-stuck.alarm\"",
        "class",        "file.size",
        "param",        list("file", "/var/lib/fts-stuck-alarm/fts-stuck.alarm"),
        "period",       60,
        "offset",       "120",
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 6000),
        "active",       true,
        "latestonly",   false,
);