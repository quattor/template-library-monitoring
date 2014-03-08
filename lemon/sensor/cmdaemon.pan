#
# Combined Metrics Daemon
#
template monitoring/lemon/sensor/cmdaemon;

# definition
"/system/monitoring/sensor/cmdaemon/cmdline" = "";

# classes
"/system/monitoring/sensor/cmdaemon/class" = list(
    	nlist("name", "CM.loadAvg", "descr","returns the loadAvg of a pre-defined cluster",
		"field",list(nlist("name", "NumberOfNodes",    "format", "%ld"),
                       	     nlist("name", "AccumulativeLoad", "format", "%.2f"),
                       	     nlist("name", "LoadAvgPerNode",   "format", "%.2f"),
		), 
        ),

   	nlist("name", "CM.userAvg", "descr","returns the average number of users within a pre-defined cluster",
		"field",list(nlist("name", "NumberOfNodesWithUsers", "format", "%ld"),
                       	     nlist("name", "AccumulativeUsers",      "format", "%ld"),
                       	     nlist("name", "UserAvgPerNode",         "format", "%.2f"),
		),
        ),

   	nlist("name", "CM.aliveNodes", "descr","returns the number of alive nodes within a pre-defined cluster",
		"field",list(nlist("name", "NumberOfNodes",   "format", "%ld"),
                       	     nlist("name", "NodesAlive",      "format", "%ld"),
                       	     nlist("name", "PercentageAlive", "format", "%.1f"),
		),
        ),
);
