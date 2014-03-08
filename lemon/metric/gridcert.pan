############################################################
#
# template monitoring/lemon/metric/gridcert
#
############################################################

template monitoring/lemon/metric/gridcert;

"/system/monitoring/metric/_807" = nlist(
	"name",      	"CertExpDate",
	"descr",     	"the expiry date of the nodes grid certificate",
	"class",     	"FIO::CertExpDate",
	"period",    	86400,
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_810" = nlist(
	"name",      	"CertOK",
	"descr",     	"the validity of the gridcert",
	"class",     	"FIO::CertOK",
	"period",    	86400, 
	"active",    	false,
	"latestonly",	false,
);