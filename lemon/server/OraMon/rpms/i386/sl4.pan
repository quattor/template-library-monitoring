template monitoring/lemon/server/OraMon/rpms/i386/sl4;

## SL4 only for the moment
"/software/packages"=pkg_repl("oracle-xe-univ","10.2.0.1-1.0",LEMON_ARCH);
#"/software/packages"=pkg_repl("oracle-xe-client","10.2.0.1-1.0",LEMON_ARCH);
"/software/packages"=pkg_repl("cx_Oracle","4.3.1-1",LEMON_ARCH);
"/software/packages"=pkg_repl("lemon-ora-admin","1.0.4-96","noarch");
####################
## rajouter par CL le 23/03/2007
"/software/packages"=pkg_repl("ncm-oramonserver","1.0.10-1","noarch");
#####################
# lemon-OraMon probleme de dependance: l'installer avec --nodeps (info from Miroslav Sicket CERN)
# This is solved by a dummy rpm now
"/software/packages"=pkg_repl("lemon-OraMon","1.2.0-1",LEMON_ARCH);
#"/software/packages"=pkg_repl("xorg-x11-xdm","13.37.2",LEMON_ARCH);
"/software/packages"=pkg_repl("xorg-x11-xdm","6.8.2-1.EL.13.25.1",LEMON_ARCH); 
"/software/packages"=pkg_repl("libc-client","2002e-14",LEMON_ARCH);
"/software/packages"=pkg_repl("php-oci8","4.3.9-3.15",LEMON_ARCH);
"/software/packages"=pkg_repl("oracle-instantclient-basic","10.2.0.3-1",LEMON_ARCH);

# this dummy rpm solves dependency problem with lemon-OraMon and needed libclntsh.so.10.1
"/software/packages"=pkg_repl("CERN-dummy-afs-provides","1-1",LEMON_ARCH);

####################Ajout CL le 23/11/2007
# Required by LCG 2.7 to run on SL 4.3
"/software/packages" = pkg_repl("libaio", "0.3.105-2", PKG_ARCH_DEFAULT);
"/software/packages" = pkg_repl("libaio-devel", "0.3.105-2", PKG_ARCH_DEFAULT);
"/software/packages" = pkg_repl("j2sdk", "1.4.2_10-fcs", "i586");
"/software/packages" = pkg_repl("words", "3.0-3", "noarch");
"/software/packages" = pkg_repl("compat-libstdc++", "7.3-2.96.128", "i386");
"/software/packages" = pkg_repl("compat-libstdc++-33", "3.2.3-47.3", "i386");
"/software/packages" = pkg_repl("commons-logging", "1.0.2-12", "i386");
"/software/packages" = pkg_repl("junit", "3.8.1-1", "i386");
"/software/packages" = pkg_repl("libgcj-ssa", "3.5ssa-0.20030801.48", "i386");
"/software/packages" = pkg_repl("cog-jar", "1.1-1", "i386");
"/software/packages" = pkg_repl("redhat-java-rpm-scripts", "1.0.2-2", "noarch");
"/software/packages" = pkg_del("compat-libstdc++-296","2.96-132.7.2");
"/software/packages" = pkg_del("tkinter","2.2.3-6.1","i386");

# Allow to add/override some packages based on OS version
include { if_exists('config/lemon/server') };

