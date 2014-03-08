#
# This file contains specifig grif CE monitoring
#
template monitoring/lemon/client/ce/config;

include { 'monitoring/lemon/metric/maui' };
include { 'monitoring/lemon/sensor/maui' };
include { 'monitoring/lemon/sensor/script/maui' };
include { 'monitoring/lemon/exception/maui' };


include { 'monitoring/lemon/metric/ce' };
include { 'monitoring/lemon/exception/ce' };
include { 'monitoring/lemon/exception/actuator/filesystem' };


# End-of-File
