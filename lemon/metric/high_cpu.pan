############################################################
#
# template monitoring/lemon/metric/high_cpu
#
############################################################

template monitoring/lemon/metric/high_cpu;

"/system/monitoring/metric/_9110" = nlist(
     	"name",         "CpuBusy",
     	"descr",        "Percentage of used CPU cycles between two samplings",
    	"class",        "FIO::CpuBusy",
     	"period",       600,
     	"smooth",       nlist("typeString", false, "maxdiff", 0.5, "maxtime", 6000),
     	"active",       true,
     	"latestonly",   false,
);