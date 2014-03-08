template monitoring/lemon/exception/remote;


"/system/monitoring/exception/_33000" = nlist(
	"name",		"http_service_down",
	"descr",	"Remote HTTP web server down",
	"importance",	1,
	"period",	300,
	"active",	true,
	"latestonly",	false,
	"minoccurs",	3,
	"correlation",	"(*:9501:5 != 200) && (*:9501:5 != 301)",
);


