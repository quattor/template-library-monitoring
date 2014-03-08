structure template monitoring/nagios/services/fullvar;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Full /var';
'check_command'= list (
'check_nrpe_disk',
    '15%',
    '5%',
    '/var');

