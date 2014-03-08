#
# monitoring/metric/vomsadmin
#

template monitoring/lemon/metric/vomsadmin;

"/system/monitoring/metric/_5220" = nlist(
	"name" ,	"voms-admin_alice_inconsistent_database",
	"descr",	"Count of inconsistency messages in alice voms-admin log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/voms-admin.alice.log",
			     "istring",   "Internal database inconsistency",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);

"/system/monitoring/metric/_5221" = nlist(
	"name" ,	"voms-admin_atlas_inconsistent_database",
	"descr",	"Count of inconsistency messages in atlas voms-admin log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/voms-admin.atlas.log",
			     "istring",   "Internal database inconsistency",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);

"/system/monitoring/metric/_5222" = nlist(
	"name" ,	"voms-admin_cms_inconsistent_database",
	"descr",	"Count of inconsistency messages in cms voms-admin log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/voms-admin.cms.log",
			     "istring",   "Internal database inconsistency",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);

"/system/monitoring/metric/_5223" = nlist(
	"name" ,	"voms-admin_dteam_inconsistent_database",
	"descr",	"Count of inconsistency messages in dteam voms-admin log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/voms-admin.dteam.log",
			     "istring",   "Internal database inconsistency",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);

"/system/monitoring/metric/_5224" = nlist(
	"name" ,	"voms-admin_lhcb_inconsistent_database",
	"descr",	"Count of inconsistency messages in lhcb voms-admin log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/voms-admin.lhcb.log",
			     "istring",   "Internal database inconsistency",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);

"/system/monitoring/metric/_5225" = nlist(
	"name" ,	"tomcat_outofmemory",
	"descr",	"Count of OutOfMemory messages in catalina log",
	"class",	"log.Parse",
	"param",	list("logfile",   "/var/log/tomcat5/catalina.out",
			     "istring",   "OutOfMemory",
			     "estring",   "^[^\\d]",
			     "dformat",   "%F %T",
			     "sincelast", "15m"),
	"period",	600,
	"active",	true,
	"latestonly",	true
);