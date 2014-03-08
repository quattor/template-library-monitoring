template monitoring/lemon/server/OraMon/rpms/i386/oracle_xe;

variable ORACLE_XE_ARCH ?= LEMON_ARCH;
## 
"/software/packages"=pkg_repl("oracle-xe-univ","10.2.0.1-1.0",ORACLE_XE_ARCH);
"/software/packages"=pkg_repl("oracle-xe-client","10.2.0.1-1.0",ORACLE_XE_ARCH);
