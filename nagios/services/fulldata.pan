structure template monitoring/nagios/services/fulldata;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Full /DATA';
'check_command'= list (
'check_nrpe_disk',
    '15%',
    '5%',
    '/DATA');

