structure template monitoring/nagios/services/fullhome;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Full /home';
'check_command'= list (
'check_nrpe_disk',
    '15%',
    '5%',
    '/home');

