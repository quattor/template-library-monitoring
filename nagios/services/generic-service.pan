structure template monitoring/nagios/services/generic-service;

"active_checks_enabled"=true;
"passive_checks_enabled"=true;
"parallelize_check"=true;
"obsess_over_service"=true;
"check_freshness"=false;
"notifications_enabled"=true;
"event_handler_enabled"=true;
"flap_detection_enabled"=true;
"failure_prediction_enabled"=true;
"process_perf_data"=true;
"retain_status_information"=true;
"retain_nonstatus_information"=true;
"is_volatile"=false;
"check_period" = "always";
"max_check_attempts" = 4;
"contact_groups" = list ("admin");
"notification_options" = list ("w", "u", "c", "r");
"notification_interval" = 240;
"notification_period" = "always";

# defaults, can be overridden
"normal_check_interval" = 15;
"retry_check_interval" = 5;
