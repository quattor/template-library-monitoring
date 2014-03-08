structure template monitoring/nagios/services/http;

include {"monitoring/nagios/services/performance-service"};

'service_description'= 'HTTP response time';
'check_command'= list (
'check_http2',
    '5',
    '10',
    '/');
'event_handler'= list (
'service_restart',
    'httpd');
