structure template monitoring/nagios/contacts;

# Example template for contacts. For questions or suggestions, contact
# mejias@delta.ft.uam.es

"admin/alias" = "Default admin";
"admin/contactgroups" = list ("admin");
"admin/service_notification_period" = "always";
"admin/host_notification_options" = list ("d", "u", "r");
"admin/service_notification_options" = list ("w", "u", "c", "r");
"admin/host_notification_commands" = list (list ("host-notify-by-email"));
"admin/service_notification_commands" = list (list ("notify-by-email"));
"admin/email" = "my-email@donotdisturb.com";
"admin/pager" = "pagenagios-admin@localhost.localdomain";
"admin/host_notification_period" = "always";
