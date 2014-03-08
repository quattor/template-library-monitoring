structure template monitoring/nagios/services/lfull;
# Local version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Full /';
'check_command'= list (
'check_local_disk',
    '15%',
    '5%',
    '/');

