structure template monitoring/nagios/services/passive-service;

include { 'monitoring/nagios/services/generic-service' };

"active_checks_enabled" = false;
"passive_checks_enabled" = true;
"normal_check_interval" = 120;
"retry_check_interval" = 120;
"notification_interval" = 0;
"max_check_attempts" = 1;
"register" = true;
"check_command" ?= list( 'check_dummy', '3', 'Service check result is old' );
