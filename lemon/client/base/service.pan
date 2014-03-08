# Template to add and configure lemon client

template monitoring/lemon/client/base/service;

include { 'monitoring/lemon/client/rpms/config' };

include { 'monitoring/lemon/client/rpms/config' };

include { 'monitoring/lemon/client/base/config' };
include { 'monitoring/lemon/sensor/group_wn' };


include { 'components/fmonagent/config' };

# Start edg-fmon-agent

"/software/components/chkconfig/service/edg-fmon-agent/on" = "";
"/software/components/chkconfig/service/edg-fmon-agent/startstop" = true;

