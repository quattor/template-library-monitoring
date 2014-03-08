############################################################
#
# template monitoring/lemon/metric/install
#
############################################################

template monitoring/lemon/metric/install;


"/system/monitoring/metric/_5015" = nlist(
	"name",      "Install",
	"descr",     "installation time",
	"class",     "FIO::InstallTime",
	"period",    0,
	"active",    true,
	"latestonly",false,
);



