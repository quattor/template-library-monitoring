structure template monitoring/nagios/services/zombies;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Zombi processes';
'check_command'= list (
'check_nrpe_procs_zombie',
    '10',
    '20');
