structure template monitoring/nagios/services/ncd;

include {"monitoring/nagios/services/slow-service"};

'service_description'='Last Quattor component run status';
'check_command'= list ('check_nrpe_ncd',);
