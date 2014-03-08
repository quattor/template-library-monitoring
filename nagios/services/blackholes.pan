structure template monitoring/nagios/services/blackholes;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Nodes becoming black holes';
'check_command'= list (
'check_nrpe',
    'check_blackhole',
    'dummy');

