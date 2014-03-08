structure template monitoring/nagios/services/load;

include {"monitoring/nagios/services/fast-service"};

'service_description'='Host load';
'check_command'= list (
'check_nrpe_load',
    '4,3,2.5',
    '5,4.3,3.6');

