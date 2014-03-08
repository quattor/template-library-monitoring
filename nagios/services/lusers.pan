structure template monitoring/nagios/services/lusers;
# Local check version
include {"monitoring/nagios/services/security-service"};

'service_description'='Usuarios activos';
'check_command'= list (
'check_users',
    '3',
    '7');
