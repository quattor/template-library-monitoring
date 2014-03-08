#
# Template monitoring/lemon/sensor/gridpx
#
# MyProxy reporting 
#
template monitoring/lemon/sensor/gridpx;

"/system/monitoring/sensor/gridpx/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MGridPx /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/gridpx/class"=list(
	nlist("name", "GridPx::PxStatus",
	      "descr","MyProxy application up or down",
	      "field",list(nlist ("name",   "status",
	                          "format", "float",
                              ))
         ),
	nlist("name", "GridPx::PxLoad",
	      "descr","MyProxy application load (requests/hour)",
	      "field",list(nlist ("name",   "load",
	                          "format", "float",
                              ))
         ),
);





