############################################################
#
# template monitoring/lemon/metric/afs
#
############################################################

template monitoring/lemon/metric/afs;

include { 'monitoring/lemon/metric/afscm' };

"/system/monitoring/metric/_46" = nlist(
	"name",      	"afsd",
	"descr",     	"\"afsd\" daemon",
	"class",     	"system.numberOfProcesses",
    	"param",     	list("name", "afsd", "uid", "0"),
	"period",    	60,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600),
	"active",    	true,
	"latestonly",	false,
);"/system/monitoring/metric/_910" = nlist(
	"name",      	"AFS_cache",
	"descr",     	"Problems with AFS cache",
	"class",     	"log.Parse",
    	"param",     	list("istring","vcache/dcache mismatch","sincelast","1h"),
	"period",    	3600,
    	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
	"active",    	true,
	"latestonly",	false,
); "/system/monitoring/metric/_911" = nlist(
         "name",         "AfsLostAndFound",
         "descr",        "Are there files under AFS cache lost+found?",
         "class",        "file.filecount",
         "param",        list("dir", "/usr/vice/cache/lost+found"),
         "period",       3600,
         "smooth",       nlist("typeString", false, "maxdiff", 0.0,"maxtime", 36000),
         "active",       true,
         "latestonly",   false,
 );
