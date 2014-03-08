structure template monitoring/nagios/services/token_atlasdatadisk;

include {"monitoring/nagios/services/slow-service"};

'service_description'='Occupation of token ATLASDATADISK';
'check_command'= list ('check_token', 'ATLASDATADISK');
