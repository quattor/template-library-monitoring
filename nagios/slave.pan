#
# Configuration for a generic Nagios slave server
#
# Contributed by: Ronald Starink    < ronalds AT nikhef DOT nl >
#
template monitoring/nagios/slave;

# run active checks
variable NAGIOS_DEFAULT_SERVICE_TEMPLATE = "monitoring/nagios/services/generic-service";

# options required for slave Nagios servers
variable NAGIOS_GENERAL_OPTIONS ?= nlist();
variable NAGIOS_GENERAL_OPTIONS = {
    x = SELF;
    x["enable_notifications"] = false;
    x["obsess_over_services"] = true;
    x["ocsp_command"] = "submit_check_result";
    x["process_performance_data"] = false;
    x;
};
