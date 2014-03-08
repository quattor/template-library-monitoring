structure template monitoring/nagios/services/arecasmart;

include {"monitoring/nagios/services/slow-service"};

'service_description'='Areca controller SMART status';
'check_command'= list (
'check_nrpe',
    'check_areca_smart',
    'dummy');

