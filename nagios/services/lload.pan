structure template monitoring/nagios/services/lload;
# Local version
include {"monitoring/nagios/services/fast-service"};

'service_description'='Host load';
'check_command'= list (
'check_local_load',
    '3.5,2.5,2',
    '5,4.3,3.6');
