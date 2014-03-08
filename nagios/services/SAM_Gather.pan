structure template monitoring/nagios/services/SAM_Gather;

include { 'monitoring/nagios/services/generic-service' };

"host_name" = list(NAGIOS_SERVER_HOSTNAME);
"servicegroups" = list("nagios-internal");
"contact_groups" = list("admin");
"normal_check_interval" = 60;
"max_check_attempts" = 4;
"retry_check_interval" = 4;
"notification_interval" = 0;
"check_command" = list("ncg_gather_sam",SITE_NAME);
