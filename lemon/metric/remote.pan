#
# monitoring/metric/remote
#
# This file contains the default metrics for the remote sensor
#
template monitoring/lemon/metric/remote;

"/system/monitoring/metric/_9500" = nlist(
	"name",       	"RemotePing",
	"descr",      	"Remote ICMP_ECHO heartbeat",
	"class",      	"remote.ping",
	"param",	list("xmlfile", "/etc/lemon/sensor-remote/ping.xml", 
			     "source",  "https://oraweb.cern.ch/pls/cdbsql/web.remote_check_ping?p_orderby=hostname&p_active=yes&p_output_format=xml"), 
	"period",     	300,
    	"offset",     	"0",
	"active",     	true,
	"latestonly", 	true,
	"latest_expires", 86400,
        "priority",     100
);

"/system/monitoring/metric/_9501" = nlist(
	"name",		"RemoteHTTP",
	"descr",	"Remote HTTP web server checks",
	"class",	"remote.http",
	"param",	list("xmlfile", "/etc/lemon/sensor-remote/http.xml",
			     "source",  "https://oraweb.cern.ch/pls/cdbsql/web.remote_check_http?p_orderby=hostname&p_active=yes&p_output_format=xml"), 
	"period",	300,
	"offset",	"0",
	"active",	true,
	"latestonly",	false,
);"/system/monitoring/metric/_9507" = nlist(
	"name",		"RemoteInfo",
	"descr",	"Returns the cluster, subcluster and state information of configured entities",
	"class",	"remote.info",
	"param",	list("xmlfile", "/etc/lemon/sensor-remote/info.xml",
			     "source",  "https://oraweb.cern.ch/pls/cdbsql/web.show?p_fld1=hostname&p_data1=%25&p_hostname=yes&p_clustername=yes&p_clustersubname=yes&p_state=yes&p_quattor=yes&p_default=no&p_outputformat=xml"),
	"period",	900,
	"offset",	"0",
	"active",	true,
	"latestonly",	false,
);
