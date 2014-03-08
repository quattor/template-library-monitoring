#
# Template monitoring/lemon/sensor/linuxha
#
# MyProxy reporting 
#
template monitoring/lemon/sensor/linuxha;

"/system/monitoring/sensor/linuxha/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MLinuxha /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/linuxha/class"=list(
	nlist("name", "Linuxha::HeartbeatStatus",
	      "descr","Heartbeat is running on the machine",
	      "field",list(nlist ("name",   "status",
	                          "format", "float",
                              ))
         ),
);





