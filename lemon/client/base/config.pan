template monitoring/lemon/client/base/config;
# 
# This template provides the means to configure the lemon-agent 

## this is the main server hostname. Lemon allows for multiple servers
variable LEMON_SERVER_HOSTNAME ?= undef;
variable LEMON_CLIENT_PORT ?= 12409;
variable LEMON_TRANSPORT_PROTOCOL ?= 'UDP';
## 
variable LEMON_SHORTHOSTNAME ?= false;

#
# general section
#
"/system/monitoring/general/logfile"    = "/var/log/edg-fmon-agent.log";
"/system/monitoring/general/cachedir"   = "/var/spool/edg-fmon-agent";
"/system/monitoring/general/resetmmaps" = true;
"/system/monitoring/general/configfile" = "/etc/lemon/agent";
"/system/monitoring/general/shorthostname" = LEMON_SHORTHOSTNAME;
"/system/monitoring/general/statepath"  = "/etc/lemon/exceptions/state.conf";

#
# transports
"/system/monitoring/transport" = nlist(
	"prod",nlist(
		"server",LEMON_SERVER_HOSTNAME, 
		"port",LEMON_CLIENT_PORT,
		"proto",LEMON_TRANSPORT_PROTOCOL,
		"nowarnings",true
	)
);
	


#
# sensors
#

# We only include the defaults here i.e the sensors from pro_monitoring_base. Including
# every sensor would only result in large node profiles and processing times at compilation
# for data that isn't even need on the node

include { 'monitoring/lemon/sensor/agent' };
include { 'monitoring/lemon/sensor/file' };
include { 'monitoring/lemon/sensor/linux' };
include { 'monitoring/lemon/sensor/exception' };
include { 'monitoring/lemon/sensor/parselog' };


#
# metrics
#
include { 'monitoring/lemon/metric/agent' };
include { 'monitoring/lemon/metric/file' };
include { 'monitoring/lemon/metric/linux' };
include { 'monitoring/lemon/metric/parselog' };


# If you wish to have lemon alarms generated and have lemon-sensor-exception installed
# uncomment these lines
#
include { 'monitoring/lemon/exception/agent' };
include { 'monitoring/lemon/exception/file' };
include { 'monitoring/lemon/exception/linux' };
include { 'monitoring/lemon/exception/parselog' };

# Start edg-fmon-agent

"/software/components/chkconfig/service/edg-fmon-agent/on" = "";
"/software/components/chkconfig/service/edg-fmon-agent/startstop" = true;

# End-of-File
