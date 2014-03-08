template monitoring/lemon/exception/dip;


"/system/monitoring/exception/_33014" = nlist(
	"name",		"UPS_Power_Heartbeat",
	"descr",	"Exception to check whether the UPS power information is being updated",
	"active",	true,
	"latestonly",	false,
	"importance",	2,
	"local",	true,
	"correlation",	"ESS01*:4323:-2 > 3600 || ESS02*:4323:-2 > 3600",
	"actuator",	nlist(
		"execve",	'/bin/sh -c \\"/usr/bin/lemon-cli -m 4323 -n \\\"*\\\" | /bin/mail -s \\\"UPS Power Monitoring Failure\\\" operations-team@cern.ch project-elfms-lemon-devel@cern.ch \\"',
		"maxruns",	1,
		"timeout",	600,
		"active",	true)
);




"/system/monitoring/exception/_33015" = nlist(
	"name",         "B513_Temperatures_Heartbeat",
	"descr",        "Exception to check whether the Temperature values for B513 are being updated",
	"active",	true,
	"latestonly",	false,
	"importance",	2,
	"local",	true,
	"correlation",	"ED05:4324:-2 > 3600",
	"actuator",	nlist(
		"execve",	'/bin/sh -c \\"/usr/bin/lemon-cli -m 4324 -n \\\"*\\\" | /bin/mail -s \\\"B513 Temperature Monitoring Failure\\\" operations-team@cern.ch project-elfms-lemon-devel@cern.ch \\"',
		"maxruns",	1,
		"timeout",	600,
		"active",	true)
);


