structure template monitoring/nagios/services/process;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Total processes';
'check_command'= list (
'check_nrpe_all_procs',
    '250',
    '400');
