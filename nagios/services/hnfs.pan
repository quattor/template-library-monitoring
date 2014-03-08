structure template monitoring/nagios/services/hnfs;

include {"monitoring/nagios/services/performance-service"};

'service_description'='NFS service status';
'check_command'= list (
'check_nrpe',
    'check_hung_mounts',
    'dummy');

