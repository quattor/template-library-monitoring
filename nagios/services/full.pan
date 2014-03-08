structure template monitoring/nagios/services/full;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Full /';
'check_command'= list (
'check_nrpe_disk',
    '15%',
    '5%',
    '/');
