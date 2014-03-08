structure template monitoring/nagios/services/lzombies;
# Local check version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Zombie processes';
'check_command'= list (
'check_procs_zombie',
    '4',
    '8');
