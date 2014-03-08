############################################################
#
# template monitoring/lemon/metric/tw
#  Check the /var/log/messages log for 3ware related problems
#
############################################################

template monitoring/lemon/metric/tw_log;

#
# Check log files for following fatal controller messages
#

# kernel: 3w-9xxx: scsi0: WARNING: (0x06:0x002C): Unit #1: Command (0x2a) timed out, resetting card.
"/system/monitoring/metric/_6124" = nlist(
        "name",         "ChkRaidTwCtlr",
        "descr",        "3ware disk log error",
        "class",        "log.Parse",
        "param",        list("istring", "kernel: .* (AEN: .* Cache synchronisation failed|WARNING:.*timed out, resetting card|ERROR.*Buffer integrity test failed)",
                             "sinceboot", "yes"),
        "period",       3600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
        "active",       true,
        "latestonly",   false,
);

# Jan  9 11:19:54 lxfs6004 kernel: 3w-xxxx: scsi1: AEN: ERROR: Drive ECC error detected: Port #0.
"/system/monitoring/metric/_6126" = nlist(
        "name",         "ChkRaidTwDisk",
        "descr",        "3ware disk log error",
        "class",        "log.Parse",
        "param",        list("istring", "kernel: .* AEN: .* (Drive ECC error detected)",
                             "sinceboot", "no"),
        "period",       3600,
        "smooth",       nlist("typeString", false, "maxdiff", 0.0, "maxtime", 36000),
        "active",       true,
        "latestonly",   false,
);#
# Raise an alarm if there are more than 5 ECC errors in an hour
#