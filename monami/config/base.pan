unique template monitoring/monami/config/base;

# add monami user
include { "users/system/monami" };

variable MONAMI_USER?="monami";

# monami main config file
variable MA_CONF =<<EOF;
##
##  This is the default MonAMI configuration file.
##
## You can alter this file and add monitoring activity here, but it is
## better to add extra activity as files within the /etc/monami.d
## directory.
##
## The User Guide contains additional information.  See:
##     /usr/share/doc/monami/userguide.html

[monami]
config_dir = /etc/monami.d
# store critical and error messages in separate files
log_info     = /var/log/monami/monami.log
log_critical = /var/log/monami/critical.log
log_error    = /var/log/monami/error.log
EOF

variable MA_CONF = {
  SELF+"\nuser="+MONAMI_USER;

};

"/software/components/filecopy/services" =
  npush(escape("/etc/monami.conf"),
        nlist("config",MA_CONF,
              "owner","root",
              "perms","0664"));
                         
# start monami service              
"/software/components/chkconfig/service/monami/on"="";
"/software/components/chkconfig/service/monami/startstop"=true;              


"/software/components/dirperm/paths"= push(
                                       nlist("path","/var/log/monami",
                                             "owner", MONAMI_USER,
                                             "type", 'd',
                                             "perm", "755") );
                                          