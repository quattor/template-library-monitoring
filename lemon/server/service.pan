template monitoring/lemon/server/service;


###############################################
## the backend: flatfile or oracle (also for oracle XE)
variable LEMON_BACKEND ?= 'OraMon';
variable LEMON_CLIENT_PORT ?= 12409;
variable LEMON_SERVER_WEB_CONFIG ?= "monitoring/lemon/server/web";

## set some specific 
include {return("monitoring/lemon/server/"+LEMON_BACKEND+"/service");};

include {return(LEMON_SERVER_WEB_CONFIG)};
include { 'monitoring/lemon/server/metric_map' };
include { 'monitoring/lemon/server/config_php' };

include { 'monitoring/lemon/server/rpms/config' };
###############################################
# ----------------------------------------------------------------------------
# chkconfig
# ----------------------------------------------------------------------------
include { 'components/chkconfig/config' };

# Stop fmon-server

"/software/components/chkconfig/service/edg-fmon-server/off" = "";


# Start httpd

"/software/components/chkconfig/service/httpd/on" = "";
"/software/components/chkconfig/service/httpd/startstop" = true;

# Start  lemonmrd

"/software/components/chkconfig/service/lemonmrd/on" = "";
"/software/components/chkconfig/service/lemonmrd/startstop" = true;

