#
# This file contains specific monitoring for mon  nodes
#
template monitoring/lemon/client/mon/config;

include { 'monitoring/lemon/metric/tomcat' };



include { 'monitoring/lemon/exception/actuator/filesystem' };


# End-of-File