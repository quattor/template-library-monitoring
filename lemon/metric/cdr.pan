############################################################
#
# template monitoring/lemon/metric/cdr
#
############################################################

template monitoring/lemon/metric/cdr;

"/system/monitoring/metric/_6231" = nlist(
	"name",      	"CDR_filetransfer",
	"descr",     	"status of CDR file transfer: number + size of files transferred in last interval, awaiting transfer, and awaiting deletion",
	"class",     	"CDR_filetransfer",
	"active",    	true,
        "period",    	300,
	"latestonly",	false,
);

