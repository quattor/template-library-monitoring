structure template monitoring/nagios/services/leth1err;
# Local version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Errors on eth1';
'check_command'= list (
'check_iferrors',
    '10',
    '2%',
    'eth1');
