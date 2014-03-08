structure template monitoring/nagios/services/bandwidth;

include {"monitoring/nagios/services/generic-service"};

"normal_check_interval" = 2;
"retry_check_interval" = 1;

'service_description'='Bandwidth';
'check_command'= list ('check_nrpe_bandwidth');
