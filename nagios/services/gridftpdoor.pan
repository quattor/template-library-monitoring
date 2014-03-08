structure template monitoring/nagios/services/gridftpdoor;

include {"monitoring/nagios/services/performance-service"};

'service_description'='gridFTP door status';
'check_command'= list ('check_gridftpdoor');

