structure template monitoring/nagios/services/usersui;
# User Interfaces should allow for more users to be logged in.
include {"monitoring/nagios/services/security-service"};

'service_description'='Active users';
'check_command'= list (
'check_nrpe_users',
    '6',
    '10');


