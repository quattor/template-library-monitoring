#
# configuration for NSCA send (client)
#
unique template monitoring/nagios/nsca/send;

include { 'components/nsca/config' };

# include NSCA add-on
include { "config/nagios/nsca/send" };

variable NSCA_PASSWORD ?= { error("Mandatory variable NSCA_PASSWORD is undefined") };
'/software/components/nsca/send/password' = NSCA_PASSWORD;

variable NSCA_ENCRYPTION_METHOD ?= 1;
'/software/components/nsca/send/encryption_method' = NSCA_ENCRYPTION_METHOD;

