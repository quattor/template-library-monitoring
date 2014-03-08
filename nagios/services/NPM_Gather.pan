structure template monitoring/nagios/services/NPM_Gather;

include { 'monitoring/nagios/services/generic-service' };

"host_name" = list(NAGIOS_SERVER_HOSTNAME);
"service_description" = "NPM-Gather";
"servicegroups" = list("nagios-internal");
"contact_groups" = list("nagios-admins");
"normal_check_interval" = 60;
"max_check_attempts" = 4;
"retry_check_interval" = 4;
"notification_interval" = 0;
"check_command" = list("ncg_gather_npm",SITE_NAME);
