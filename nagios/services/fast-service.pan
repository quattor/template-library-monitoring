structure template monitoring/nagios/services/fast-service;

include {"monitoring/nagios/services/generic-service"};

"normal_check_interval" = 5;
"retry_check_interval" = 1;
