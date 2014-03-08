#
# monitoring/metric/afscm
#
template monitoring/lemon/metric/afscm; 

# metrics
"/system/monitoring/metric/_901/" = nlist(
	"name",      	"cmufs",
	"descr",     	"Cache UFS Statistics",
	"class",    	 "afscm.cmufs",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_902/" = nlist(
	"name",     	 "cmstats",
	"descr",     	"Main Cache Statistics",
	"class",     	"afscm.cmstats",
	"period",    	300,
	"active",    	true,
	"latestonly",	false,
);