#
# This file contains specific monitoring for se_dpm  nodes
#
template monitoring/lemon/client/se_dpm/config;

include { 'monitoring/lemon/metric/se_dpm' };

# need to add se_dpm exceptions

include { 'monitoring/lemon/exception/actuator/filesystem' };


# End-of-File