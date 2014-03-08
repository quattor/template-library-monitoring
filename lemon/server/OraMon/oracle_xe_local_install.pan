template monitoring/lemon/server/OraMon/oracle_xe_local_install;

## This should better be put in a separate oracle setup

# ---------------------------------------------------------------------------- 
# chkconfig
# ---------------------------------------------------------------------------- 
include { 'components/chkconfig/config' };
"/software/components/chkconfig/service/oracle-xe/on" = ""; 

include { 'users/oracle' };
## add apache to oracle group
"/software/components/accounts/users/apache/groups" = push("dba");

## Oramon directory
include { 'components/dirperm/config' };
"/software/components/dirperm/paths" =
 push(nlist(
   "path", "/var/log/OraMon.log",
   "owner", "lemon:lemon",
   "perm", "0644",
   "type", "f"
 ),
 nlist(
  "path", "/var/lib/OraMon/",
  "owner", "lemon:lemon",
  "perm", "0775",
  "type", "d"
 ),
 nlist(
  "path", "/var/lib/OraMon/Heartbeat",
  "owner", "lemon:lemon",
  "perm", "0775",
  "type", "d"
 ),
 nlist(
  "path", "/var/oracle",
  "owner", "oracle:dba",
  "perm", "0775",
  "type", "d"
 ),
);


  