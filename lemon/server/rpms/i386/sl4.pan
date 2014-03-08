template monitoring/lemon/server/rpms/i386/sl4;

include { 'config/lemon/base' };


"/software/packages"=pkg_repl("edg-fabricMonitoring-server","2.13.0-3","i386");

"/software/packages"=pkg_repl("rrdtool","1.0.50-3.el4.rf",LEMON_ARCH);


"/software/packages"=pkg_repl("lrf","1.0.7-15","i386");

#"/software/packages"=pkg_repl("ncm-fmonagent","1.0.32-1","noarch");

variable WEBSERVER_CONFIG={
        os='sl430-i386'; if(NODE_OS_VERSION==os) return('monitoring/lemon/server/rpms/i386/sl43_web_server');
        os='sl440-i386'; if(NODE_OS_VERSION==os) return('rpms/web_server');
        os='sl450-i386'; if(NODE_OS_VERSION==os) return('rpms/web_server');
		os='sl460-i386'; if(NODE_OS_VERSION==os) return('rpms/web_server');

        # If we're here, we did not find any OS for which there is web server  config (yet) :
        error("could not find any web server config that could match NODE_OS_VERSION : " + NODE_OS_VERSION);
        null;
};

include { return(WEBSERVER_CONFIG) };


# not in any OS group
"/software/packages"=pkg_repl("php-gd","4.3.9-3.15",LEMON_ARCH);
"/software/packages"=pkg_repl("php-imap","4.3.9-3.15",LEMON_ARCH);

