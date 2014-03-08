template monitoring/lemon/sensor/lxstat;

# how our sensor will get launched
"/system/monitoring/sensor/lxstat/cmdline"="/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl lxstat";
# in case we would like to have multiple sensors in one piece of code? unused.
"/system/monitoring/sensor/lxstat/module_names" = "lxstat";
# additional capabilities we don't support anyway.
"/system/monitoring/sensor/lxstat/supports" = "NoCFG NoSOD NoCHK VER";

# information on the individual sensors
"/system/monitoring/sensor/lxstat/class"=list(
           nlist("name", "lxstat.update",
                  "descr","(unique) machines using the linuxsoft update service in the last 24h",
                  "field",list(
                       nlist ("name","os", "format", "%16s", "primary", true),
                       nlist ("name","arch", "format", "%16s", "primary", true),
                       nlist ("name","total", "format", "integer", "unit", "count", "scale", 1.0),
                       nlist ("name","internal", "format", "integer", "unit", "count", "scale", 1.0),
                       nlist ("name","external", "format", "integer", "unit", "count", "scale", 1.0),
                       nlist ("name","CDB", "format", "integer", "unit", "count", "scale", 1.0),
                               )
                 ),
           nlist("name", "lxstat.install",
                  "descr","(unique) machines using the linuxsoft install service in the last 24h",
                  "field",list(
                       nlist ("name","os", "format", "%16s", "primary", true),
                       nlist ("name","arch", "format", "%16s", "primary", true),
                       nlist ("name","total", "format", "integer", "unit", "count", "scale", 1.0),
                               )
                 ),

        );

