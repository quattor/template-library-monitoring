structure template monitoring/nagios/services/mountswn;

include {"monitoring/nagios/services/slow-service"};

'service_description' = 'NFS mount point status';
'check_command' = list ('check_nrpe_mounts', 'your_mount_point');
'event_handler' = list ('remount', 'your_mount_point');
