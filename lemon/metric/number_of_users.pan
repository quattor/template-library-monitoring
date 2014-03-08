############################################################
#
# template monitoring/lemon/metric/number_of_users
#
############################################################

template monitoring/lemon/metric/number_of_users;

"/system/monitoring/metric/_4105" = nlist(
	"name",     	"NumberOfUsers",
	"descr",     	"numbers of users active (ie. with processes) on the machine",
	"class",     	"system.numberOfUsers",
	"period",    	300,
	"smooth",    	nlist("typeString",false,   "maxdiff",   0.0,  "maxtime",  3000),
	"active",    	true,
	"latestonly",	false,
);
