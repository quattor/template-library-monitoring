template monitoring/ganglia/client/i386/rpms;

variable GANGLIA_DEPRECATED ?= true;
include { if ( GANGLIA_DEPRECATED ) {
                error('monitoring/ganglia : Please include monitoring/ganglia/config instead of monitoring/ganglia/client/i386/rpms define GANGLIA_DEPRECATED to true to avoid this message');
        } else {
                null;
        };
};

"/software/packages"=pkg_repl("ganglia-gmond","3.0.7-1","i386");
