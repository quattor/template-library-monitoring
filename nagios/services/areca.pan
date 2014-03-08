structure template monitoring/nagios/services/areca;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Areca controller RAID status';
'check_command'= list (
'check_nrpe',
    'check_areca',
    'dummy');

