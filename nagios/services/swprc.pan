structure template monitoring/nagios/services/swprc;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Swapped processes';
'check_command'= list (
'check_nrpe_procs_swap',
    '4',
    '6');
