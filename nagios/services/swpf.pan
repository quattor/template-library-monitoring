structure template monitoring/nagios/services/swpf;

include {"monitoring/nagios/services/fast-service"};

'service_description'='Free swap';
'check_command'= list (
'check_nrpe_swap',
    '40%',
    '10%');
