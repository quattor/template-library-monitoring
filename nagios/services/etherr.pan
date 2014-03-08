structure template monitoring/nagios/services/etherr;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Errors on eth0';
'check_command'= list (
'check_nrpe_iferrors',
    '10',
    '2%',
    'eth0');
