structure template monitoring/nagios/services/security-service;
# Generic service: base check for security features.
include {"monitoring/nagios/services/fast-service"};

"normal_check_interval" = 20;
"is_volatile" = true;
