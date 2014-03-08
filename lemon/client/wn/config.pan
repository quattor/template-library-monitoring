#
# This file contains specific grif WN monitoring
#
template monitoring/lemon/client/wn/config;

include { 'monitoring/lemon/metric/wn' };
include { 'monitoring/lemon/exception/wn' };
include { 'monitoring/lemon/exception/actuator/wn' };
include { 'monitoring/lemon/exception/actuator/filesystem' };
# Start edg-fmon-agent

"/software/components/chkconfig/service/edg-fmon-agent/on" = "";
"/software/components/chkconfig/service/edg-fmon-agent/startstop" = true;



# End-of-File
