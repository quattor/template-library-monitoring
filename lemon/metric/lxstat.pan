template monitoring/lemon/metric/lxstat;

"/system/monitoring/metric/_6700" = nlist(
    "name", "lxstat_u",
    "descr", "linuxsoft update service usage in the last 24h",
    "class", "lxstat.update",
    "param", list("archs", "i386 x86_64 ia64",
		  "distros","redhat6 redhat7 slc3 slc4 slc5",
		  "servicename","linuxsoft_updaters",
                  "dir","/var/lx-stats",
	     ),
    "period", 86400,
    "active", true,
    "latestonly", false,
    "reftime", "06:00",
);

"/system/monitoring/metric/_6701" = nlist(
    "name", "lxstat_i",
    "descr", "linuxsoft install service usage in the last 24h",
    "class", "lxstat.install",
    "param", list("archs", "i386 x86_64 ia64",
		  "distros","slc3 slc4 slc5 rhel3 rhel4 rhel5 other",
		  "servicename","linuxsoft_installs"
	     ),
    "period", 86400,
    "active", true,
    "latestonly", false,
    "reftime", "06:00",
);
