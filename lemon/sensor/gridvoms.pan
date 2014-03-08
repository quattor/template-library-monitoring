#
# Template monitoring/lemon/sensor/voms
#
# VOMS reporting 
#
template monitoring/lemon/sensor/gridvoms;

"/system/monitoring/sensor/gridvoms/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MGridVoms /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/gridvoms/class"=list(
	nlist("name", "GridVoms::VomsStatus",
	      "descr","Voms application up or down",
	      "field",list(nlist ("name",   "status",
	                          "format", "float",
                              ))
         ),
	nlist("name", "GridVoms::VomsLoad",
	      "descr","Voms application load (active searches)",
	      "field",list(nlist ("name",   "load",
	                          "format", "float",
                              ))
         ),
);





