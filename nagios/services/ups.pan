structure template monitoring/nagios/services/ups;

include {"monitoring/nagios/services/fast-service"};

'service_description'='UPS status';
'check_command'= list ('check_ups');
'event_handler'= list ('server_shutdown');
