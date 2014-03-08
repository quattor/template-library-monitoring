template monitoring/lemon/server/rpms/i386/sl43_web_server;

## SL4.3 only 

"/software/packages"=pkg_repl("httpd","2.0.52-22.ent",LEMON_ARCH);
"/software/packages"=pkg_repl("httpd-suexec","2.0.52-22.ent",LEMON_ARCH);
"/software/packages"=pkg_repl("php-ldap","4.3.9-3.15",LEMON_ARCH);
"/software/packages"=pkg_repl("php-pear","4.3.9-3.15",LEMON_ARCH);
"/software/packages"=pkg_repl("php","4.3.9-3.15",LEMON_ARCH);
"/software/packages"=pkg_repl("system-config-httpd","1.3.1-1","noarch");


