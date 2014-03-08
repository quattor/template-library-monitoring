#
# monitoring/lemon/sensor/ipsrvmon
#
# This file contains the sensor definition for the ipsrvmon sensor
#
template monitoring/lemon/sensor/ipsrvmon;

# command line
"/system/monitoring/sensor/ipsrvmon/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl IpSrvMon";

# additional protocols the sensor supports
"/system/monitoring/sensor/ipsrvmon/supports" = "CFG SOD NoCHK VER";

# module names
"/system/monitoring/sensor/ipsrvmon/module_names" = "IpSrvMon";

# environment variables
"/system/monitoring/sensor/ipsrvmon/env" = nlist(
		"ORACLE_HOME",     "/afs/cern.ch/project/oracle/@sys/prod",
	        "LD_LIBRARY_PATH", "/afs/cern.ch/project/oracle/@sys/prod/lib",
		"TNS_ADMIN",	   "/afs/cern.ch/project/oracle/admin/");

# classes
"/system/monitoring/sensor/ipsrvmon/class" = list(
    	nlist("name", "ipsrvmon.query",
        	"descr", "IP service network traffic throughput monitoring",
	      	"field", list(
			nlist("name", "input",  "format", "%ld", "scale", 1.0, "unit", "bytes"),
                       	nlist("name", "output", "format", "%ld", "scale", 1.0, "unit", "bytes"),
  		)
        ),
); 





