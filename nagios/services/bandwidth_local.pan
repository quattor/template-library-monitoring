structure template monitoring/nagios/services/bandwidth_local;
# Local version
include {"monitoring/nagios/services/generic-service"};

"normal_check_interval" = 1;
"retry_check_interval" = 1;

'service_description'='Bandwidth';
'check_command'= list (
'check_local_bandwidth');

