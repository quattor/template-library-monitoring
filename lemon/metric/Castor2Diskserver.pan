#
#
#

template monitoring/lemon/metric/Castor2Diskserver;

"/system/monitoring/metric/_6261" = nlist(
        "name",         "GetSmsState",
        "descr",        "returns CASTOR2 sms state information",
        "class",        "Castor2Diskserver.GetSmsState",
        #"param",        list("path", "/tmp/last4",),
        "period",       60,
        #"offset",       "60-420",
        "active",       false,
        "latestonly",   false,
	"smooth", nlist("typeString", true, "maxtime", 3600),
);

"/system/monitoring/metric/_6262" = nlist(
        "name",         "GetRmNodesState",
        "descr",        "returns CASTOR2 rmnode state information",
        "class",        "Castor2Diskserver.GetRmNodesState",
        #"param",        list("path", "/tmp/last4",),
        "period",       60,
        #"offset",       "60-420",
        "active",       false,
        "latestonly",   false,
	"smooth", nlist("typeString", true, "maxtime", 3600),

);### NOT TO BE USED!!!

