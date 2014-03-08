#
# Configuration for the generic Nagios master server
#
# Contributed by: Ronald Starink    < ronalds AT nikhef DOT nl >
#
template monitoring/nagios/master;

# enable action URLs for services and hosts
variable PNP4NAGIOS_ENABLE = true;
variable PNP4NAGIOS_BASE_URL ?= '/nagios/html/pnp4nagios/index.php';

# default: passive services
variable NAGIOS_DEFAULT_SERVICE_TEMPLATE = "monitoring/nagios/services/passive-service";

# Options for the main configuration file
variable NAGIOS_GENERAL_OPTIONS ?= nlist();
variable NAGIOS_GENERAL_OPTIONS = {
    x = SELF;
    # Nagios options that are required for a master server
    x["accept_passive_service_checks"] = true;  # 
    x["enable_notifications"] = true;
    x["obsess_over_services"] = false;       # master does not obsess    
    x["ocsp_command"] = null;
    
    # Optional configuration for performance data via pnp4nagios
    if ( exists( PNP4NAGIOS_ENABLE ) && PNP4NAGIOS_ENABLE ) {
        x["process_performance_data"] = true;
        x["host_perfdata_command"] = null;
        x["host_perfdata_file"] = '/var/nagios/host-perfdata';
        x["host_perfdata_file_template"] =
            'DATATYPE::HOSTPERFDATA\tTIMET::$TIMET$\tHOSTNAME::$HOSTNAME$\tHOSTPERFDATA::$HOSTPERFDATA$\tHOSTCHECKCOMMAND::$HOSTCHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::$HOSTSTATETYPE$';
        x["host_perfdata_file_processing_command"] = list( 'process-host-perfdata-file' );
        x["host_perfdata_file_processing_interval"] = 30;
        x["service_perfdata_command"] = null;
        x["service_perfdata_file"] = '/var/nagios/service-perfdata';
        x["service_perfdata_file_template"] =
            'DATATYPE::SERVICEPERFDATA\tTIMET::$TIMET$\tHOSTNAME::$HOSTNAME$\tSERVICEDESC::$SERVICEDESC$\tSERVICEPERFDATA::$SERVICEPERFDATA$\tSERVICECHECKCOMMAND::$SERVICECHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::$HOSTSTATETYPE$\tSERVICESTATE::$SERVICESTATE$\tSERVICESTATETYPE::$SERVICESTATETYPE$';
        x["service_perfdata_file_processing_command"] = list( 'process-service-perfdata-file' );
        x["service_perfdata_file_processing_interval"] = 15;
    };    

    x;
};


# webinterface
variable NAGIOS_START_APACHE ?= true;

