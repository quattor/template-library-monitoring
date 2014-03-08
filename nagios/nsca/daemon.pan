#
# configuration for NSCA daemon
#
template monitoring/nagios/nsca/daemon;

include { 'components/nsca/config' };

include { 'config/nagios/nsca/daemon'};

variable NSCA_PID_FILE ?= "/var/run/nsca.pid";
'/software/components/nsca/daemon/pid_file' = NSCA_PID_FILE;

variable NSCA_PORT ?= 5667;
'/software/components/nsca/daemon/server_port' = NSCA_PORT;

variable NSCA_SERVER_ADDRES ?= null;
'/software/components/nsca/daemon/server_address' = NSCA_SERVER_ADDRES;

variable NSCA_USER ?= "nagios";
'/software/components/nsca/daemon/user' = NSCA_USER;

variable NSCA_GROUP ?= "nagios";
'/software/components/nsca/daemon/group' = NSCA_GROUP;

variable NSCA_CHROOT ?= null;
'/software/components/nsca/daemon/chroot' = NSCA_CHROOT;

variable NSCA_DEBUG ?= false;
'/software/components/nsca/daemon/debug' = NSCA_DEBUG;

variable NSCA_COMMAND_FILE ?= "/var/log/nagios/rw/nagios.cmd";
'/software/components/nsca/daemon/command_file' = NSCA_COMMAND_FILE;

variable NSCA_ALT_DUMP_FILE ?= "/var/log/nagios/rw/nsca.dump";
'/software/components/nsca/daemon/alt_dump_file' = NSCA_ALT_DUMP_FILE;

variable NSCA_AGGREGATE_WRITES ?= false;
'/software/components/nsca/daemon/aggregate_writes' = NSCA_AGGREGATE_WRITES;

variable NSCA_APPEND_TO_FILE ?= false;
'/software/components/nsca/daemon/append_to_file' = NSCA_APPEND_TO_FILE;

variable NSCA_MAX_PACKET_AGE ?= 30;
'/software/components/nsca/daemon/max_packet_age' = NSCA_MAX_PACKET_AGE;

variable NSCA_PASSWORD ?= { error("Mandatory variable NSCA_PASSWORD is not defined"); };
'/software/components/nsca/daemon/password' = NSCA_PASSWORD;

variable NSCA_DECRYPTION_METHOD ?= 1;
'/software/components/nsca/daemon/decryption_method' = NSCA_DECRYPTION_METHOD;


# start NSCA daemon on boot
include { 'components/chkconfig/config' };
"/software/components/chkconfig/service/nsca/on" = "";
"/software/components/chkconfig/service/nsca/startstop" = true;

