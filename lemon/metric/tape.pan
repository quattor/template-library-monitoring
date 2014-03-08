############################################################
#
# template monitoring/lemon/metric/tape
#
############################################################

template monitoring/lemon/metric/tape;

"/system/monitoring/metric/_6608" = nlist(
	"name",      	"ReportTapeDrive",
	"descr",     	"Report on tape drive activity",
	"class",     	"tape.driveStats",
	"period",       86400,
        "reftime",	"03:45", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	true,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_drive.csh"),
);

"/system/monitoring/metric/_6611" = nlist(
	"name",      	"ReportTapeVolumesPool",
	"descr",     	"Report on tape media usage by tape pool",
	"class",     	"tape.volumesPool",
	"period",       86400,
        "reftime",	"01:00", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_volumes --format pool","onbehalf","true"),
);

"/system/monitoring/metric/_6612" = nlist(
	"name",      	"ReportTapeVolumesLibrary",
	"descr",     	"Report on tape media usage by tape robot library",
	"class",     	"tape.volumesLibrary",
	"period",       86400,
        "reftime",	"01:00", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_volumes --format library","onbehalf","true"),
);

"/system/monitoring/metric/_6613" = nlist(
	"name",      	"ReportTapeRatePool",
	"descr",     	"Report on rate of usage of media by pool",
	"class",     	"tape.ratePool",
	"period",       86400,
        "reftime",	"02:00", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_volumes_rate --format pool","onbehalf","true"),
);

"/system/monitoring/metric/_6614" = nlist(
	"name",      	"ReportTapeRateLibrary",
	"descr",     	"Report on rate of usage of media by library",
	"class",     	"tape.rateLibrary",
	"period",       86400,
        "reftime",	"02:00", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_volumes_rate --format library","onbehalf","true"),
);

"/system/monitoring/metric/_6615" = nlist(
	"name",      	"ReportTapeRateSupply",
	"descr",     	"Report on rate of usage of media by supply pools",
	"class",     	"tape.rateSupply",
	"period",       86400,
        "reftime",	"02:00", 
   	"smooth",    	nlist("typeString", false, "index", 1, "maxdiff", 1.0, "maxtime", 6000),
	"active",    	false,
	"latestonly",	false,
 	"param",	list("command","/usr/sbin/tsbn_volumes_rate --format supply --filter supply","onbehalf","true"),
);

# Sep 15 04:39:33 rtcopyd[5438,4]: New file request:  -F F -E keep -o -q 1048 lxfsrk4303.cern.ch:/srv/castor/02//57/138549957@castorns.258820372
"/system/monitoring/metric/_6616" = nlist(
        "name",         "TapeServerNewFileRequest",
        "descr",        "Count the new file request lines per hour",
        "class",        "log.Parse",
        "param",        list("istring", "New file request:",
                             "sincelast", "15m"),
        "period",       900,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
        "active",       true,
        "latestonly",   false,
);

