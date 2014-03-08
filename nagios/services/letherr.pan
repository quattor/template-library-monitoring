structure template monitoring/nagios/services/letherr;
# Local version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Errors on eth0';
'check_command'= list (
'check_iferrors',
    '10',
    '2%',
    'eth0');

