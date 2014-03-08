############################################################
#
# template monitoring/lemon/metric/lsf
#
############################################################

template monitoring/lemon/metric/lsf;

"/system/monitoring/metric/_4005" = nlist(
	"name",      	"lim",
	"descr",     	"LSF \"lim\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "lim", "uid", "0"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	true,
);"/system/monitoring/metric/_4007" = nlist(
	"name",      	"sbatchd",
	"descr",     	"LSF \"sbatchd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "sbatchd", "uid", "0"),
	"period",	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_4009" = nlist(
	"name",      	"res",
	"descr",     	"LSF \"res\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "res", "uid", "0"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_5012" = nlist(
	"name",      	"OldShutdowntime",
	"descr",    	"If the file /etc/shutdowntime exists, its timestamp cannot be old",
	"class",     	"LSF::OldShutdowntime",
	"period",    	600,
	"offset",    	"300",
    	"smooth",    	nlist("typeString", true, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
);"/system/monitoring/metric/_6402" = nlist(
	"name",      	"HostNjobs",
	"descr",     	"returns a list of LSF hosts and the number of jobs on them",
	"class",     	"HostNjobs",
	"period",    	900,
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6403" = nlist(
	"name",      	"ChkTokenExtension",
	"descr",     	"Can LSF jobs get fresh AFS tokens?",
	"class",     	"LSF::ChkTokenExtension",
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	false,
	"latestonly",	false,
);
"/system/monitoring/metric/_6404" = nlist(
        "name",      	"HostPsNjobs",
        "descr",     	"returns number of LSF jobs as reported by ps",
        "class",     	"LSF::HostPsNjobs",
        "period",    	3600,
        "active",    	false,
        "latestonly",	true,
);

"/system/monitoring/metric/_6405" = nlist(
        "name",      	"HostState",
        "descr",     	"returns distribution of hosts in each LSF state",
        "class",     	"LSF::HostState",
        "period",    	900,
        "active",    	false,
        "latestonly",	true,
);