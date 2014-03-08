#
# monitoring/metric/lumber
#
# Contact: Gang.Qin@cern.ch
#
template monitoring/lemon/metric/lumber;

"/system/monitoring/metric/_5300" = nlist(
	"name",		"process_heartbeat",
	"descr",	"Generic check to see if processes are running correctly and executes automated recovery actions",
	"class",	"lumber.process",
	"period",	60,
	"smooth",	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",	true,
	"latestonly",	true
);