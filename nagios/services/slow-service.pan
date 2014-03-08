structure template monitoring/nagios/services/slow-service;
# Generic service, slow checks.
include {"monitoring/nagios/services/fast-service"};

"normal_check_interval" = 60;
"notification_interval" = 420;
"retry_check_interval" = 20;
