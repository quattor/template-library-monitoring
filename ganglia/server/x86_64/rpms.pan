template monitoring/ganglia/server/x86_64/rpms;

variable GANGLIA_DEPRECATED ?= true;

include { if ( GANGLIA_DEPRECATED ) {
                error('monitoring/ganglia : Please include monitoring/ganglia/config instead of monitoring/ganglia/server/x86_64/rpms define GANGLIA_DEPRECATED to true to avoid this message');
        } else {
                null;
        };
};

"/software/packages"=pkg_repl("ganglia-gmetad","3.1.1-1","x86_64");
"/software/packages"=pkg_repl("ganglia-web","3.1.1-1","noarch");
"/software/packages"=pkg_repl("rrdtool","1.2.23-1.el5.rf","x86_64");
"/software/packages"=pkg_repl("perl-rrdtool","1.2.23-1.el5.rf","x86_64");
"/software/packages"=pkg_repl("expat","1.95.8-8.2.1","x86_64");
"/software/packages"=pkg_repl("libganglia-3_1_0","3.1.1-1","x86_64");
"/software/packages"=pkg_repl("libconfuse","2.5-4.el5","x86_64");

include { "rpms/web_server" };
