template monitoring/nagios/nrpe/config;


include {'components/nrpe/config'};

variable NRPE_RPMS_TEMPLATE ?= 'rpms/nrpe';
include { NRPE_RPMS_TEMPLATE };

# Allowed Nagios servers, f.i: list ("nagiosserv.my.domain", "nagiosserv.your.domain")
variable NAGIOS_SERVERS ?= list();
variable NRPE_ALLOWED_HOSTS ?= NAGIOS_SERVERS;
"/software/components/nrpe/options/allowed_hosts" ?= NRPE_ALLOWED_HOSTS;

# Start on boot? Don't use this, it's better to use ncm-chkconfig instead
#variable NRPE_ADD_TO_RC ?= false;
#"/software/components/nrpe/add_rc" ?= NRPE_ADD_TO_RC;

# Port to listen
variable NRPE_PORT ?= 5666;
"/software/components/nrpe/options/server_port" ?= NRPE_PORT;

# User and group for NRPE daemon
variable NRPE_USER ?= 'nagios';
"/software/components/nrpe/options/nrpe_user" ?= NRPE_USER;
variable NRPE_GROUP ?= 'nagios';
"/software/components/nrpe/options/nrpe_group" ?= NRPE_GROUP;

# Timeout for checks
variable NRPE_TIMEOUT ?= 60;
"/software/components/nrpe/options/connection_timeout" ?= NRPE_TIMEOUT;

# Allow a weak random seed. Do not set to true unless you know what
# you are doing!!
variable NRPE_WEAK_RANDOM_SEED ?= false;
"/software/components/nrpe/options/allow_weak_random_seed" ?=  NRPE_WEAK_RANDOM_SEED;

variable NRPE_ALLOW_CMDARGS ?= false;
#"/software/components/nrpe/options/allow_cmdargs" ?= NRPE_ALLOW_CMDARGS;

# nlist of NRPE commands
variable NRPE_COMMANDS ?= nlist();
"/software/components/nrpe/options/command" ?= NRPE_COMMANDS;
