template monitoring/lemon/server/OraMon/lemon_oramon;


variable ORAMON_DIR ?= "/var/lemon";
variable ORAMON_SOAP_PORT ?= '12410';
variable ORAMON_ORACLE_USER ?= 'griflemon';
variable ORAMON_ORACLE_PASSWD ?= undef;



##
variable LEMON_SOURCE_AUTH = ORAMON_ORACLE_USER+'/'+ORAMON_ORACLE_PASSWD+'@'+ORAMON_ORACLE_DATABASE_NAME;
variable LEMON_PHP_AUTH = '"'+ORAMON_ORACLE_USER+'" => array("'+ORAMON_ORACLE_USER+'","'+ORAMON_ORACLE_PASSWD+'","'+ORAMON_ORACLE_DATABASE_NAME+'")';

## Oramon directory
include { 'components/dirperm/config' };
"/software/components/dirperm/paths" =
 push(nlist(
  "path", ORAMON_DIR,
  "owner", "lemon:lemon",
  "perm", "0775",
  "type", "d"
  )
 );


# ---------------------------------------------------------------------------- 
# filecopy
# ---------------------------------------------------------------------------- 
include { 'components/filecopy/config' };


############ oramon-server ################
#  /etc/lemon/server/lemon-oramon-server.conf
### OraMon config file
variable CONTENTS_ORAMON_SERVER = <<EOF;
#Configuration file for Lemon Oracle Monitoring Server
number_receive_threads = 10
heartbeat_interval = 10
auth_mode = 1
key_dir = /etc/lemon/keys
key_hash_size = 256
tester_host =
EOF
variable CONTENTS_ORAMON_SERVER = CONTENTS_ORAMON_SERVER + 
"password=" + ORAMON_ORACLE_PASSWD +"\n" +
"port=" + to_string(LEMON_CLIENT_PORT) + "\n" +
"soap_port=" + to_string(ORAMON_SOAP_PORT) + "\n" +
"spool_dir=" + ORAMON_DIR+"/OraMon\n" + "\n" +
"database_name=" + ORAMON_ORACLE_DATABASE_NAME + "\n" +
"user=" + ORAMON_ORACLE_USER + "\n" +
"server_user=" + ORAMON_ORACLE_USER + "\n";

variable CONTENTS_ORAMON_SERVER = CONTENTS_ORAMON_SERVER + <<EOF;
number_insertion_threads = 2
read_only = no
soap_enabled = no
partitions_thread = no
check_entities = no
dbcommit_interval = 10
read_frequency =
maxload_allowed =
minswap_requiredkb =


EOF
"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/server/lemon-oramon-server.conf"),
        nlist("config",CONTENTS_ORAMON_SERVER,
              "restart","/etc/init.d/OraMon restart",
              "perms","0644"));

## OraMon services
include { 'components/etcservices/config' };
"/software/components/etcservices/entries" = 
  push("oramon-sample "+to_string(LEMON_CLIENT_PORT)+"/tcp");
"/software/components/etcservices/entries" = 
  push("oramon-sample "+to_string(LEMON_CLIENT_PORT)+"/udp");
"/software/components/etcservices/entries" = 
  push("oramon-soap "+to_string(ORAMON_SOAP_PORT)+"/tcp");

