#
#
#

template monitoring/lemon/sensor/heartbeat_diskarray;
"/system/monitoring/sensor/diskarrayheartbeat/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MDiskArrayHeartBeat /usr/libexec/sensors/edg-fmon-sensor.pl -PUT=03";
                                                                                                                                      
"/system/monitoring/sensor/diskarrayheartbeat/class"=list(
    nlist("name", "DiskArrayHeartBeat::getHeartBeat",
          "descr","Determine SNMP status",
          "field",list(nlist ("name","alive", "format", "%ld"),
                      )
         ),
);
