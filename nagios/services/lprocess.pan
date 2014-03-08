structure template monitoring/nagios/services/lprocess;
# Local version
include {"monitoring/nagios/services/performance-service"};

'service_description'='Processes';
'check_command'= list (
'check_all_procs',
    '150',
    '200');
