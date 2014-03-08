############################################################
#
# template monitoring/lemon/metric/ipmi
#
############################################################

template monitoring/lemon/metric/ipmi;

"/system/monitoring/metric/_6100" = nlist(
	"name",      	"cputemperature",
	"descr",     	"average and standard deviation of the cpu temperature",
	"class",     	"IPMI.cpu",
        "param",     	list("searchstring", "(Processor|CPU)","units","degrees C"),
   	"period",    	1800,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6101" = nlist(
	"name",      	"fanspeedchassis",
	"descr",     	"average and standard deviation of fan rotation speed of the chassis",
	"class",     	"IPMI.fan",
        "param",     	list("searchstring", "F[Aa][nN]","units","RPM"),
   	"period",    	1800,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6102" = nlist(
	"name",      	"voltage3_3",
	"descr",     	"Reading of the 3.3V voltage",
	"class",     	"IPMI.voltage",
        "param",     	list("searchstring", "3.3V "),
   	"period",    	1800,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6103" = nlist(
	"name",      	"systemtemperature",
	"descr",     	"Motherboard temperature",
	"class",     	"IPMI.avgrmscnt",
        "param",     	list("searchstring", "SYSTEM"),
   	"period",    	300,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6104" = nlist(
	"name",      	"sel",
	"descr",     	"IPMI SEL Log",
	"class",     	"IPMI.sel",
   	"period",    	300,
        "param",     	list("searchstring", "ignore"),
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6105" = nlist(
	"name",      	"systemfan",
	"descr",     	"System board fans",
	"class",     	"IPMI.avgrmscnt",
        "param",     	list("searchstring", "^FAN","units","RPM"),
   	"period",    	900,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6106" = nlist(
	"name",      	"cpufan",
	"descr",     	"CPU fans",
	"class",     	"IPMI.avgrmscnt",
        "param",     	list("searchstring", "^CPU[0-9]","units","RPM"),
   	"period",    	900,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6107" = nlist(
	"name",      	"systemdelta",
	"descr",     	"System board temperature change rate",
	"class",     	"IPMI.avgdelta",
        "param",     	list("searchstring", "SYSTEM"),
   	"period",    	300,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	true,
	"latestonly",	false,
);

"/system/monitoring/metric/_6108" = nlist(
	"name",      	"powermeter",
	"descr",     	"Power Meter",
	"class",     	"IPMI.avgrmscnt",
        "param",     	list("searchstring", "Power Meter","units","Watts"),
   	"period",    	300,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6109" = nlist(
	"name",      	"ipmiping",
	"descr",     	"Remote connectivity with ipmiping",
	"class",     	"IPMI.ping",
        "param",     	list("type", "ipmi"),
   	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	false,
	"latestonly",	false,
);

"/system/monitoring/metric/_6110" = nlist(
	"name",      	"rmcpping",
	"descr",     	"Remote connectivity with rmcpping",
	"class",     	"IPMI.ping",
        "param",     	list("type", "rmcp"),
   	"period",    	3600,
   	"smooth",    	nlist("typeString", false, "maxdiff", 0.0, "maxtime", 86400),
	"active",    	false,
	"latestonly",	false,
);#
# Check if the IPMI sensor is reporting no IPMI data
#   -5 means that the IPMI connection is not working at all.
#   -4 means that no match for the system board temperature pattern was found#
# Raise an alarm if there is major packet loss for IPMI over 20 minutes
#