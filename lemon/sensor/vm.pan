#
# monitoring/lemon/sensor/vm
#
# This file contains the sensor definition for virtual machine performance monitoring. 
# It measures the cpu utilisation on the current host for every virtual machine and in 
# total for the physical machine, the node.
#
template monitoring/lemon/sensor/vm;

# definition
"/system/monitoring/sensor/vm/cmdline" = "/usr/libexec/sensors/lemon-sensor-vm";

# additional protocols the sensor supports
"/system/monitoring/sensor/vm/supports" = "CFG SOD CHK VER";

# class definitions
"/system/monitoring/sensor/vm/class" = list(

	nlist(	"name", 	"vm.nodecpuusage",
		"descr", 	"domain and node cpu utilisation of a virutalised machine",
		"field", 	list(
				nlist(	"name",	"DomainName", "format",	"%30s", "descr", "Name of the DomU/0 or the Total", "primary", true),
				nlist(	"name",	"CpuUtilisation", "format", "%05.1f", "descr","CPU utilisation as a percentage rate","unit","percentage rate", "scale", 1.0),
				nlist(	"name",	"CpuTime", "format", "%ld", "descr","CPU time consumed in seconds", "unit", "seconds","scale", 0.000000001),)
	     ),		
);

# End-of-File
