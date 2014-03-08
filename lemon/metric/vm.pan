#
# monitoring/metric/vmsensor
#
# This file contains the default metrics for the linux sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-2
#
template monitoring/lemon/metric/vm;

"/system/monitoring/metric/_9300" = nlist(
    "name",      	"NodeCpuUtil",
    "descr",     	"Cpu Utilisation as a percentage for each virtual machine on a physical machine and in total.",
    "class",     	"vm.nodecpuusage",
    "period",    	300,
    "active",    	true,
    "latestonly",	false,
);

# End-of-File	    
