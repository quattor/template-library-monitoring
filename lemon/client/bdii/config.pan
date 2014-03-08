#
# This file contains specific grif BDII monitoring
#
template monitoring/lemon/client/bdii/config;

include { 'monitoring/lemon/metric/gridbdii' };
include { 'monitoring/lemon/sensor/gridbdii' };
include { 'monitoring/lemon/sensor/script/gridbdii' };
include { 'monitoring/lemon/exception/gridbdii' };
include { 'monitoring/lemon/exception/actuator/gridbdii' };


# End-of-File
