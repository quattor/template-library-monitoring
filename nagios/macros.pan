# Template with Nagios macros definitions. Define "MACRO", which will
# be translated as $MACRO$ by the component.

structure template monitoring/nagios/macros;

"USER1" = {
    if (match (NODE_OS_VERSION, "x86_64$")) {
	    "/usr/lib64/nagios/plugins";
	} else {
	    "/usr/lib/nagios/plugins";
	}
};

"USER2" = {
    if (match (NODE_OS_VERSION, "x86_64$")) {
    	    "/usr/lib64/nagios/plugins/eventhandlers";
	} else {
	    "/usr/lib/nagios/plugins/eventhandlers";
	}
};

"USER3" = {
    if (match (NODE_OS_VERSION, "x86_64$")) {
            "/usr/lib64/nagios/plugins/wlcg";
        } else {
            "/usr/lib/nagios/plugins/wlcg";
        }
};
