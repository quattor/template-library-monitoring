############################################################
#
# template monitoring/lemon/metric/linuxha
#
############################################################

template monitoring/lemon/metric/linuxha;

"/system/monitoring/metric/_849" = nlist(
	"name",      	"HeartbeatStatus",
	"descr",     	"returns 0 if heartbeat is down, >0 if up",
	"class",     	"Linuxha::HeartbeatStatus",
	"period",    	120,
	"active",    	false,
	"latestonly",	false,
);