#
# template monitoring/lemon/metric/tapequeue
#
template monitoring/lemon/metric/tapequeue;

"/system/monitoring/metric/_6609" = nlist(
	"name",		"TapeQueueDGN",
	"descr",	"Tape queue analysis by DGN",
	"class",	"tapequeue.queueprobedgn",
	"period",	900,
        "param",        list("service", "castortape"),
	"active",	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6610" = nlist(
	"name",		"TapeQueueVO",
	"descr",	"Tape queue analysis by VO",
	"class",	"tapequeue.queueprobevo",
	"period",	900,
        "param",        list("service", "castortape"),
	"active",	true,
	"latestonly",	false,
);
