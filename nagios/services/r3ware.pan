structure template monitoring/nagios/services/r3ware;

include {"monitoring/nagios/services/performance-service"};

'service_description'='3ware RAID status';
'check_command'= list (
'check_nrpe',
    'check_3ware',
    'dummy');

