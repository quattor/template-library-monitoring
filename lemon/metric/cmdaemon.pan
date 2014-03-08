#
# Combined Metrics Daemon
#
template monitoring/lemon/metric/cmdaemon;

"/system/monitoring/metric/_7000" = nlist(
	"name",      	"CM.pipe",
	"descr",     	"link between edg-fmon-agent and CMDaemon",
	"class",     	"file.dump",
        "param",     	list("file", "/var/run/cmdaemon.pipe",
                          	"multitype","1"),
	"period",    	0,
	"active",    	true,
	"latestonly",	true,
);