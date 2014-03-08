structure template monitoring/nagios/services/users;

include {"monitoring/nagios/services/security-service"};

'service_description'='Active users';
'check_command'= list (
'check_nrpe_users',
    '3',
    '7');
"is_volatile" = false;
