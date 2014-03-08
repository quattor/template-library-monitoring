structure template monitoring/nagios/services/dcache;

include {"monitoring/nagios/services/fast-service"};

'service_description'='dcache pools status';
'check_command'= list (
'check_dcache_pools');
