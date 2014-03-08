#
# template monitoring/lemon/metric/ipsrvmon
#
template monitoring/lemon/metric/ipsrvmon;

"/system/monitoring/metric/_9250" = nlist(
	"name",      	"IpSrvMonThroughPut",
	"descr",     	"IP service network traffic throughput monitoring",
	"class",     	"ipsrvmon.query",
    	"param",     	list("user",    "lemon", 
			     "pass",    "verizete",
			     "connect", "dbi:Oracle:hacsdb", 
			     "timeout", "120"),
	"period",    	60,
	"active",    	true,
	"latestonly",	false,
);
