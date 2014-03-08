structure template monitoring/nagios/services/underload;

include {"monitoring/nagios/services/performance-service"};

'service_description'='Nodes with stalled jobs';
'check_command'= list ('check_nrpe', 'check_unloaded', 'dummy');
'retry_check_interval' = 15;
'max_check_attempts' = 15;
'notifications_enabled' = false;
