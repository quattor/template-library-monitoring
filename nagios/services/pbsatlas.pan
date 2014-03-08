structure template monitoring/nagios/services/pbsatlas;

include {"monitoring/nagios/services/performance-service"};

'service_description'='PBS queues';
'check_command'= list (
'check_nrpe_pbs',
    '',
    '1',
    '5',
    '1',
    '5',
    'atlas');
'event_handler'= list ('stop_blackhole');
