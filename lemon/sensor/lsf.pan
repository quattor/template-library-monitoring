#
#
#
template monitoring/lemon/sensor/lsf;

"/system/monitoring/sensor/lsf/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MLSF /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/lsf/class"=list(
#	nlist("name", "lim",
#	      "descr","LSF \"lim\" daemon",
#	      "field",list(nlist ("name",   "lim",
#	                          "format", "integer",
#                              ))
#         ),
#	nlist("name", "sbatchd",
#	      "descr","LSF \"sbatchd\" daemon",
#	      "field",list(nlist ("name",   "sbatchd",
#	                          "format", "integer",
#                              ))
#         ),
#	nlist("name", "res",
#	      "descr","LSF \"res\" daemon",
#	      "field",list(nlist ("name",   "res",
#	                          "format", "integer",
#                              ))
#         ),
#    nlist("name", "/pool.use",
#          "descr","Occupancy of \"/pool\" filesystem [%]",
#	      "field",list(nlist ("name",   "FileSystemUse",
#	                          "format", "float",
#                              ))
#         ),
#    nlist("name", "/pool.quota",
#          "descr","User quota on \"/pool\" filesystem",
#	      "field",list(nlist ("name",   "FileSystemQuota",
#	                          "format", "integer",
#                              ))
#         ),
    nlist("name", "LSF::ChkTokenExtension",
          "descr","Can LSF jobs get fresh AFS tokens?",
	      "field",list(nlist ("name",   "ChkTokenExtension",
	                          "format", "integer",
                              ))
         ),
    nlist("name", "LSF::OldShutdowntime",
          "descr","If the file /etc/shutdowntime exists, its timestamp cannot be old",
	      "field",list(nlist ("name",   "OldShutdowntime",
	                          "format", "char50",
                              ))
         ),
    nlist("name", "HostStatus",
          "descr","returns a list of LSF hosts and their states",
	      "field",list(nlist ("name",   "Host",
	                          "format", "char20",
                              ),
                       nlist ("name",   "Status",
	                          "format", "char20",
                              )),
         ),
    nlist("name", "HostNjobs",
          "descr","returns a list of LSF hosts and the number of jobs on them",
	      "field",list(nlist ("name",   "Host",
	                          "format", "char20",
                              ),
                       nlist ("name",   "Njobs",
	                          "format", "integer",
                              )),
         ),
    nlist("name", "LSF::HostPsNjobs",
          "descr","returns the number of LSF jobs running on the node, as reported by ps",
              "field",list(nlist ("name",   "LSFjobs",
                                  "format", "integer",
                             )),
         ),
    nlist("name", "LSF::HostState",
          "descr","returns the distribution of hosts in each LSF state",
          "field",list( nlist("name","total",      "format","integer"),
			nlist("name","ok",         "format","integer"),
			nlist("name","closed_Busy","format","integer"),
			nlist("name","closed_Full","format","integer"),
			nlist("name","closed_Adm", "format","integer"),
			nlist("name","closed_LIM", "format","integer"),
			nlist("name","unreach",    "format","integer"),
			nlist("name","unavail",    "format","integer"),
		),
         ),
);





