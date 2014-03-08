structure template monitoring/nagios/services/expire-service;

include {"monitoring/nagios/services/slow-service"};

"normal_check_interval" = 2880;
"notification_interval" = 3000;
