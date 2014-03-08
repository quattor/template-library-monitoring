############################################################
#
# template monitoring/lemon/metric/gridvoms
#
############################################################

template monitoring/lemon/metric/gridvoms;

"/system/monitoring/metric/_808" = nlist(
	"name",      	"VomsStatus",
	"descr",     	"returns <0 if down, >=0 if up",
	"class",     	"GridVoms::VomsStatus",
	"period",    	120,
	"latestonly",	false,
	"active",    	false,
);

"/system/monitoring/metric/_809" = nlist(
        "name",      	"VomsLoad",
        "descr",     	"Returns a value for the current load",
        "class",     	"GridVoms::VomsLoad",
        "period",    	120,
        "active",    	false,
        "latestonly",	false,
);