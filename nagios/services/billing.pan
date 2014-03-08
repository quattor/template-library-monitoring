structure template monitoring/nagios/services/billing;

include {"monitoring/nagios/services/slow-service"};

'service_description' = 'dCache connections';
'check_command' = list ('check_billing');
