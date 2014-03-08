############################################################
#
# template monitoring/lemon/metric/zombies
#
############################################################

template monitoring/lemon/metric/zombies;

"/system/monitoring/metric/_4107" = nlist(
	"name",      "zombies",
	"descr",     "the number of zombie processes",
	"class",     "system.numberOfProcesses",
    	"param",     list("state","Z"),
	"period",    60,
    	"smooth",    nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",   600),
	"active",    true,
	"latestonly",false,
);
