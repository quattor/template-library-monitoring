structure template monitoring/nagios/services/lswprc;
# Local check version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Swap processes';
'check_command'= list (
'check_procs_swap',
    '4',
    '6');
