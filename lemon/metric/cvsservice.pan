#
# monitoring/metric/cvsservice
#
# This file contains the default metrics for the cvs remote sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/metric/cvsservice;

"/system/monitoring/metric/_9502" = nlist(
	"name", 	"cvsAvailability",
	"descr", 	"Availability of cvsservice in 3 connection methods",
	"class", 	"cvs.Availability",
	"param", 	list(  
				"base:droot","/afs/cern.ch/project/cvs",
				"base:cvs_krb_user","cvstest@CERN.CH",
				"base:test_dir","/afs/cern.ch/project/cvs/reps/anaphe /afs/cern.ch/project/cvs/dist/readable /afs/cern.ch/user/c/cvsadmin/scripts",
				"base:kinit_cmd","/usr/kerberos/bin/kinit -4 -5 -k -t ",
				"base:afslog_cmd","/usr/kerberos/bin/afslog",
				"base:klist_cmd","/usr/kerberos/bin/klist",
				"base:kdestroy_cmd","/usr/kerberos/bin/kdestroy",
				"base:workdir","/var/run/sensor-cvs",
				"base:kerb_keytab","/var/run/sensor-cvs/keyt",
				"base:kerb_lifetime","1800",
				"base:cvsuser","cvstest",
				"base:pserver_check","^ui$",
				"base:ignore_reps","itcobe",
				"base:check_file","CVSROOT/commitinfo",

				"cvscentral:cvshost", "isscvs.cern.ch",
				"cvscentral:cvsdir", "/local/reps",
				"cvscentral:cvs_afs_dir","/afs/cern.ch/project/cvs/reps",

				"cvslcg:cvsdir", "/cvs",
				"cvslcg:cvshost","PROJECT.cvs.cern.ch"
			),
	"period", 	7200,
	"offset",	"60",
 	"active", 	false,
	"latestonly", 	false,
);

"/system/monitoring/metric/_9503" = nlist(
	"name", 	"cvsPerformance",
	"descr", 	"Timing of a test checkout on the cvs service",
	"class", 	"cvs.Performance",
	"param", 	list(
				"base:cvs_krb_user","cvstest@CERN.CH",
				"base:kinit_cmd","/usr/kerberos/bin/kinit -4 -5 -k -t ",
				"base:afslog_cmd","/usr/kerberos/bin/afslog",
				"base:klist_cmd","/usr/kerberos/bin/klist",
				"base:kdestroy_cmd","/usr/kerberos/bin/kdestroy",
				"base:kerb_keytab","/var/run/sensor-cvs/keyt",
				"base:kerb_lifetime","1800",
				"base:cvsperf_project","ui",
				"base:cvsperf_dir","perftest",
				"base:workdir","/var/run/sensor-cvs",

				"base:cvsuser","cvstest",

				"cvscentral:cvshost", "isscvs.cern.ch",
				"cvscentral:cvsdir","/local/reps",

				"cvslcg:cvshost","ui.cvs.cern.ch",
				"cvslcg:cvsdir","/cvs"
			),
	"period",	300,
	"offset",	"60",
	"active", 	false,
	"latestonly", 	false,
);