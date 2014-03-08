# 
# Template monitoring/lemon/sensor/gris 
# 
# BDII reporting 
# 
template monitoring/lemon/sensor/gridgris; 

"/system/monitoring/sensor/gridgris/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MGridGris /usr/libexec/sensors/edg-fmon-sensor.pl"; 

"/system/monitoring/sensor/gridgris/class"=list( 
    nlist("name", "GridGris::GrisStatus", 
          "descr","GRIS application up or down", 
          "field",list(nlist ("name", "status", 
                              "format", "float", 
                     )) 
        ), 
   nlist("name", "GridGris::GrisLoad", 
         "descr","GRIS application load (active searches)", 
         "field",list(nlist ("name", "load", 
                             "format", "float", 
                     )) 
        ), 
   nlist("name", "GridGris::GrisGatekeeper", 
         "descr","Gatekeeper application is up or down", 
         "field",list(nlist ("name", "status", 
                             "format", "float", 
                     )) 
        ), 
); 


