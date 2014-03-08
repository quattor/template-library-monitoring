##################################################################
#                                                                #
# Name    :      monitoring/metric/lsfstatus                #
# Purpose :      sensor for LSF status and accounting            #
# Created :      Tue Nov 28 14:30:15 CET 2006                    #
# Author  :      Ulrich Schwickerath                             #
# Changes :                                                      #
#                                                                #
##################################################################

template monitoring/lemon/metric/lsfstatus;

# from queue status

"/system/monitoring/metric/_6406" = nlist(
	"name",       "lsfqueuestatus",
        "descr",      "LSF Queue status",
        "class",      "lsfstatus.queues",
	"param",      list("instance",""),
	"period",     60,
	"active",     false,
	"latestonly", false
);


# from host status: lcg/share, plus, and all the others (not plus, not (lcg or share))
"/system/monitoring/metric/_6407" = nlist(
	"name",       "hoststatus",
        "descr",      "LSF worker node status",
        "class",      "lsfstatus.hosts",
	"param",      list("instance","",
			   "resources","",
		           "ostypes",""
                           ),
	"period",     60,
	"active",     false,
	"latestonly", false
);


#### Accounting information

##
"/system/monitoring/metric/_6408" = nlist(
	"name",       "lsfaccounting",
        "descr",      "LSF accounting information",
        "class",      "lsfstatus.acct",
	"param",      list("instance","",
			   "vonames",""
		           ),
	"period",     60, 
	"active",     false,
	"latestonly", false
);

# per-user statistics
"/system/monitoring/metric/_6409" = nlist(
	"name",       "lsfaccountingusers",
        "descr",      "Per-user LSF accounting information",
        "class",      "lsfstatus.acct_users",
	"param",      list("instance","",
			   "vonames",""
		           ),
	"period",     60, 
	"active",     false,
	"latestonly", false
);
