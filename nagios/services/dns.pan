structure template monitoring/nagios/services/dns;

include {"monitoring/nagios/services/fast-service"};

'service_description'='DNS response time';
'check_command'= list (
'check_dns',
    'www.cern.ch',
    '2',
    '5');
