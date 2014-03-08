template monitoring/lemon/exception/lbserver;


"/system/monitoring/exception/_30013" = nlist(
	"name",		"LoadBalancingDaemonWrong",
	"descr",	"Load Balancing Daemon wrong",
	"active",	true,
	"latestonly",	false,
	"importance", 	2,
        "minoccurs",	2,
	"alarmtext",	"loadbalancing_wrong",
	"correlation",	"36:1 != 1"
);




"/system/monitoring/exception/_30095"=nlist(
	"name",		"LoadBalancingUpdateFailed",
	"descr",	"Load Balancing Update failed",
	"active",	true,
	"latestonly",	false,
	"importance",	2,
	"alarmtext",	"loadbalancing_failed",
	"correlation",	"5118:1 > 0",
);




"/system/monitoring/exception/_30135" = nlist(
	"name",		"LoadBalancingStuck",
	"descr",	"Load Balancing Stuck",
	"active",	true,
	"local",	true,
	"latestonly",	false,
	"importance",	2,
	"correlation",	"(5117:1 > 1800)",
	"actuator",	nlist(
		"execve",	'/bin/sh -c \\"/usr/bin/tail -10 /var/log/lb/lbd.log | /bin/mail -s \\\"Load Balancing Stuck\\\" it-dep-fio-smod@cern.ch Vladimir.Bahyl@cern.ch\\"',
		"maxruns",	1,
		"timeout",	900,
		"active",	true)
);

