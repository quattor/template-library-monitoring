template monitoring/lemon/exception/hwprobe;

#
# EDAC exceptions
#   - bad ECC rates
#	- more than 0 uncorrectable error / hour
#	- more than 25 correctable errors  / hour
#   - PCI bus errors
#	- more than 5 parity errors  / hour
#

"/system/monitoring/exception/_30519" = nlist(
        "name",         "edac_mem",
        "descr",        "EDAC memory errors",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "edac_mem",
        "correlation",  "6053:1>0 || 6053:2>25"
);


"/system/monitoring/exception/_30520" = nlist(
        "name",         "edac_pci",
        "descr",        "EDAC PCI errors",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "edac_pci",
        "correlation",  "6053:3>5"
);

