structure template monitoring/nagios/services/lswpf;
# Local version
include {"monitoring/nagios/services/fast-service"};

'service_description'='Free swap';
'check_command'= list (
'check_swap',
    '40%',
    '10%');
