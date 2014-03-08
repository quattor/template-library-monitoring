############################################################
#
# template monitoring/lemon/metric/sata
#  Check the /var/log/messages log for SATA disk related problems
#  See https://twiki.cern.ch/twiki/bin/view/FIOgroup/DiskPrbSata
#
############################################################

template monitoring/lemon/metric/sata;

#
# Check log files for following serious errors
#  kernel: ata1: status=0x51 { DriveReady SeekComplete Error }
#  kernel: lost page write due to I/O error on sda5
#  kernel: ata1: error=0x40 { UncorrectableError }
#  kernel: ata2: PIO error
#  kernel:  I/O error: dev 08:08, sector 305640
# 
"/system/monitoring/metric/_6133" = nlist(
        "name",         "ChkDiskSataLog",
        "descr",        "SATA disk log error",
        "class",        "log.Parse",
        "param",        list("istring", "kernel: .*(DriveReady SeekComplete Error|lost page write due to|UncorrectableError|port reset,p_is|dma timeout retry|I/O error: dev)",
                             "sinceboot", "no",
                             "sincelast", "24h"),
        "period",       3600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 360000),
        "active",       true,
        "latestonly",   false,
);