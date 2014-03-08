structure template monitoring/nagios/services/token_atlasmcdisk;

include {"monitoring/nagios/services/slow-service"};

'service_description'='Occupation of token ATLASMCDISK';
'check_command'= list ('check_token', 'ATLASMCDISK');
