structure template monitoring/nagios/services/cert;

include {"monitoring/nagios/services/expire-service"};

'service_description'='Host certificates expiry dates';
'check_command'= list (
'check_nrpe_certdates',
    '14',
    '7');
