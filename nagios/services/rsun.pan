structure template monitoring/nagios/services/rsun;

include {"monitoring/nagios/services/performance-service"};

'service_description'='LSI SAS RAID status';
'check_command'= list (
'check_nrpe',
    'check_raid_sun',
    'dummy');
