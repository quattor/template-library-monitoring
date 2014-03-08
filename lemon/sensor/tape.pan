#
# lemon-sensor-tape
#
template monitoring/lemon/sensor/tape;

# definition
"/system/monitoring/sensor/tape/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Tape";

# additional protocols the sensor supports
"/system/monitoring/sensor/tape/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/tape/module_names" = "Tape";

# classes
"/system/monitoring/sensor/tape/class" = list(
	nlist(
		"name", "tape.driveStats",
		"descr", "Tape drive statistics",
		"field", list(
			nlist("name","device_group",          	"format", "%12s"),
			nlist("name","tape_device_name",      	"format", "%12s"),
			nlist("name","all_tape_mounts",       	"format", "integer"),
			nlist("name","failed_mounts",         	"format", "integer"),
			nlist("name","read_mounts",           	"format", "integer"),
			nlist("name","write_mounts",           	"format", "integer"),
			nlist("name","average_mount_time",    	"format", "integer", "unit", "seconds"),
			nlist("name","files_read",            	"format", "integer"),
			nlist("name","datavolume_read",    	"format", "integer", "unit", "bytes", "scale", 1024.0),
			nlist("name","files_written",         	"format", "integer"),
			nlist("name","datavolume_written", 	"format", "integer", "unit", "bytes", "scale", 1024.0),
		)
	),
	nlist (
		"name", "tape.volumesPool",
		"descr", "Tape usage by tape pool reported onbehalf of the pool",
		"field", list (
			nlist("name","count",		    "format","integer","unit","tapes","descr","Tapes in pool"),
			nlist("name","capacity",	    "format","float","scale",1073741824.0,"unit","bytes","descr","Total"),
			nlist("name","used",		    "format","float","scale",1073741824.0,"unit","bytes","descr","Used"),
			nlist("name","free",		    "format","float","scale",1073741824.0,"unit","bytes","descr","Free"),
			nlist("name","nbfiles",		    "format","float","unit","files","descr","Avg files per tape"),
			nlist("name","rcount",		    "format","float","unit","mounts","descr","Avg read mounts"),
			nlist("name","wcount",		    "format","float","unit","mounts","descr","Avg write mounts"),
			nlist("name","full",		    "format","float","unit","tapes","descr","Full tapes"),
			nlist("name","empty",		    "format","float","unit","tapes","descr","Empty tapes"),
		)
	),
	nlist (
		"name", "tape.volumesLibrary",
		"descr", "Tape usage by library on behalf of the library",
		"field", list (
			nlist("name","count",		    "format","integer","unit","tapes","descr","Tapes in library"),
			nlist("name","capacity",	    "format","float","scale",1073741824.0,"unit","bytes","descr","Total"),
			nlist("name","used",		    "format","float","scale",1073741824.0,"unit","bytes","descr","Used"),
			nlist("name","free",		    "format","float","scale",1073741824.0,"unit","bytes","descr","Free"),
			nlist("name","nbfiles",		    "format","float","unit","files","descr","Avg files per tape"),
			nlist("name","rcount",		    "format","float","unit","mounts","descr","Avg read mounts"),
			nlist("name","wcount",		    "format","float","unit","mounts","descr","Avg write mounts"),
			nlist("name","full",		    "format","float","unit","tapes","descr","Full tapes"),
			nlist("name","empty",		    "format","float","unit","tapes","descr","Empty tapes"),
		)
	),
	nlist(
		"name", "tape.ratePool",
		"descr", "rate of usage of tapes in a pool",
		"field", list (
			nlist("name","rateweekly",	    "format","float"),
			nlist("name","ratemonthly",	    "format","float"),
			nlist("name","rateyearly",	    "format","float"),
			nlist("name","daysempty",	    "format","float"),
			nlist("name","dateempty",           "format", "%8s"),
		)
	),
	nlist(
		"name", "tape.rateLibrary",
		"descr", "rate of usage of tapes in a library",
		"field", list (
			nlist("name","rateweekly",	    "format","float"),
			nlist("name","ratemonthly",	    "format","float"),
			nlist("name","rateyearly",	    "format","float"),
			nlist("name","daysempty",	    "format","float"),
			nlist("name","dateempty",           "format", "%8s"),
		)
	),
	nlist(
		"name", "tape.rateSupply",
		"descr", "rate of usage of tapes in supply pools",
		"field", list (
			nlist("name","rateweekly",	    "format","float"),
			nlist("name","ratemonthly",	    "format","float"),
			nlist("name","rateyearly",	    "format","float"),
			nlist("name","daysempty",	    "format","float"),
			nlist("name","dateempty",           "format", "%8s"),
		)
	),
);
