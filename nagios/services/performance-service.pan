structure template monitoring/nagios/services/performance-service;
# Base checks for features that will affect performance.
include {"monitoring/nagios/services/fast-service"};

"normal_check_interval" = 30;
"retry_check_interval" = 5;
