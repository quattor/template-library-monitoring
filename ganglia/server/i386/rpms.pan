template monitoring/ganglia/server/i386/rpms;

variable GANGLIA_DEPRECATED ?= true;

include { if ( GANGLIA_DEPRECATED ) {
        	error('monitoring/ganglia : Please include monitoring/ganglia/config instead of monitoring/ganglia/server/i386/rpms define GANGLIA_DEPRECATED to true to avoid this message');
	} else {
		null;
	};
};

"/software/packages"=pkg_repl("ganglia-gmetad","3.0.7-1","i386");
"/software/packages"=pkg_repl("ganglia-web","3.0.7-1","noarch");
"/software/packages"=pkg_repl("perl-Time-HiRes","1.55-3","i386");
"/software/packages"=pkg_repl("rrdtool","1.2.23-1.el4.rf","i386");
"/software/packages"=pkg_repl("perl-rrdtool","1.2.23-1.el4.rf","i386");
include { "rpms/web_server" };
