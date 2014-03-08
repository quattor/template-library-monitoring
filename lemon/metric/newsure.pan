#
# monitoring/metric/newsure
#
template monitoring/lemon/metric/newsure;

"/system/monitoring/metric/_6002" = nlist(
	"name",       	"NewSendStatus",
	"descr",      	"Send the status of the node to SURE",
	"class",      	"sure.sendStatus",
	"param",	list("server1", "cnsure.cern.ch:4242"),
	"period",     	300,
    	"offset",     	"30-330",
	"active",     	true,
	"latestonly", 	true,
);
