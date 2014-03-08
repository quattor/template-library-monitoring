###########################################################
#
# template monitoring/lemon/metric/qla
#   Check the status of the fibre channel port
#
############################################################

template monitoring/lemon/metric/qla;

"/system/monitoring/metric/_6140" = nlist(
	"name",      	"ChkQlaPort",
	"descr",     	"Problem with Qlogic fibre channel port",
	"class",     	"qla.portstatus",
	"period",    	600,
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);