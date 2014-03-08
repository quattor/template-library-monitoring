structure template monitoring/nagios/generic_host;
# Example of Nagios host.
"max_check_attempts" = 10;
"check_command" = list ("check-host-alive");
"check_period" = "always";
"notification_interval" = 60;
"notification_period" = "always";
"notification_options" = list ("d", "u", "r");
"contact_groups" = list ("admin");
"action_url" = PNP4NAGIOS_HOST_ACTION_URL;
