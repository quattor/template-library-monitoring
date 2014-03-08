# Template configuring the entire Nagios server.
# Responsible: Luis Fernando Muñoz Mejías <mejias@delta.ft.uam.es>
template monitoring/nagios/config;

include {'components/nagios/config'};
include {'config/nagios/server/config'};
include {'components/nagios/functions'};
include {'monitoring/nagios/functions/hw_list'};

# optionally, include pnp4nagios configuration
variable PNP4NAGIOS_ENABLE ?= false;
variable PNP4NAGIOS_SERVICE_ACTION_URL ?= null;
variable PNP4NAGIOS_HOST_ACTION_URL ?= null;
include { if ( PNP4NAGIOS_ENABLE ) { 'config/nagios/server/pnp4nagios' } else { null }; };


# Template for a basic host.
variable NAGIOS_BASE_HOST ?= 'monitoring/nagios/generic_host';


# "Additional hosts to be monitored by nagios, but that don't belong to"
# (S)CDB. Put here routers and stuff like that.
variable NAGIOS_EXTRA_HOSTS ?= list();

variable NAGIOS_LOAD_BASE_TEMPLATE ?= "monitoring/nagios/services/load";

# NAGIOS_HOSTS_TEMPLATE may point to a structure template defining the hosts
# If it is undefined, derive the list of all hosts from the machine database
# NAGIOS_DB_MACHINE
variable NAGIOS_HOSTS_TEMPLATE ?= "monitoring/nagios/hosts";
variable NAGIOS_DB_MACHINE ?= DB_MACHINE;
"/software/components/nagios/hosts" = {
    if ( is_defined( NAGIOS_HOSTS_TEMPLATE ) ) {
        hosts = create( NAGIOS_HOSTS_TEMPLATE );
    }
    else {
        # derive from machine database  
        hw_listing = generate_hw_structure( NAGIOS_DB_MACHINE );
        hosts = generate_plain_host_list( HW_LISTINGS );
    };
    hosts;
};

"/software/components/nagios/hosts" =  {
    foreach (i; host; NAGIOS_EXTRA_HOSTS) {
        SELF[host] = create (NAGIOS_BASE_HOST);
    };
    SELF;
};

# Template with home-made commands
variable NAGIOS_COMMANDS_TEMPLATE ?= "monitoring/nagios/commands";
"/software/components/nagios/commands" ?= create (NAGIOS_COMMANDS_TEMPLATE);



# Template with additional host aliases
variable NAGIOS_HOSTALIASES_TEMPLATE ?= 'monitoring/nagios/hostaliases';
include {NAGIOS_HOSTALIASES_TEMPLATE};

# Structure template with host groups
variable NAGIOS_HOSTGROUPS_TEMPLATE ?= "monitoring/nagios/hostgroups";
"/software/components/nagios/hostgroups" ?= create (NAGIOS_HOSTGROUPS_TEMPLATE);

# Structure template with macros ($USER1$ and such stuff should come here
variable NAGIOS_MACROS_TEMPLATE ?= "monitoring/nagios/macros";
"/software/components/nagios/macros" ?= create (NAGIOS_MACROS_TEMPLATE);

# Structure template with timeperiods definitions
variable NAGIOS_TIMEPERIODS_TEMPLATE ?= "monitoring/nagios/timeperiods";
"/software/components/nagios/timeperiods" = create (NAGIOS_TIMEPERIODS_TEMPLATE);

# Structure template with contacts for each alarm
variable NAGIOS_CONTACTS_TEMPLATE ?= "monitoring/nagios/contacts";
"/software/components/nagios/contacts" ?= create (NAGIOS_CONTACTS_TEMPLATE);
# Structure template with groups of contacts
variable NAGIOS_CONTACTGROUPS_TEMPLATE ?= "monitoring/nagios/contactgroups";
"/software/components/nagios/contactgroups" ?= create (NAGIOS_CONTACTGROUPS_TEMPLATE);


# Namespace where our Nagios sensors are stored.
variable NAGIOS_SERVICE_NS ?= "monitoring/nagios/services/";

# List of templates 
variable NAGIOS_SERVICE_TEMPLATES ?= nlist();
"/software/components/nagios/services" ?= {
    services = nlist();
    foreach (i; tpl; NAGIOS_SERVICE_TEMPLATES) {
        srv = create (NAGIOS_SERVICE_NS+tpl);
        key = escape (srv["service_description"]);
        srv["service_description"] = null;
        if (is_defined (services[key])) {
            services[key][length (services[key])] = srv;
        } else {
            services[key] = list (srv);
        };
    };
    services;
};

variable NAGIOS_SERVICEGROUPS_TEMPLATE ?= "monitoring/nagios/servicegroups";
"/software/components/nagios/servicegroups" ?= create (NAGIOS_SERVICEGROUPS_TEMPLATE);

#variable NAGIOS_SERVICEDEPENDENCIES_TEMPLATE ?= "monitoring/nagios/servicedependencies";
#"/software/components/nagios/servicedependencies" ?= create (NAGIOS_SERVICEDEPENDENCIES_TEMPLATE);

variable NAGIOS_SERVICEEXTINFO_TEMPLATES ?= list ();
"/software/components/nagios/serviceextinfo" ?= {
    foreach (i; extinfo; NAGIOS_SERVICEEXTINFO_TEMPLATES) {
        push (create (extinfo));
    };
};

variable NAGIOS_EXPLICIT_SERVICES ?= nlist();
"/software/components/nagios/services" = {
    if (is_defined (NAGIOS_EXPLICIT_SERVICES)) {
        merge (SELF, NAGIOS_EXPLICIT_SERVICES);
    } else {
        SELF;
    };
};

variable NAGIOS_EXPLICIT_SERVICEDEPENDENCIES ?= null;
"/software/components/nagios/servicedependencies"=list();
"/software/components/nagios/servicedependencies" = {
    if (is_defined (NAGIOS_EXPLICIT_SERVICEDEPENDENCIES)) {
        merge (SELF, NAGIOS_EXPLICIT_SERVICEDEPENDENCIES);
    } else {
        SELF;
    };
};

variable NAGIOS_EXPLICIT_SERVICEGROUPS ?= null;
"/software/components/nagios/servicegroups" = {
    if (is_defined (NAGIOS_EXPLICIT_SERVICEGROUPS)) {
        merge (SELF, NAGIOS_EXPLICIT_SERVICEGROUPS);
    } else {
        SELF;
    };
};

variable NAGIOS_EXPLICIT_SERVICEEXTINFO ?= null;
"/software/components/nagios/serviceextinfo"=list();
"/software/components/nagios/serviceextinfo" = {
    if (is_defined (NAGIOS_EXPLICIT_SERVICEEXTINFO)) {
        merge (SELF, NAGIOS_EXPLICIT_SERVICEEXTINFO);
    } else {
        SELF;
    };
};


variable NAGIOS_GENERAL_OPTIONS ?= nlist ("admin_email", "nagios",
    "accept_passive_service_checks", true,
    "check_external_commands", true,
);

"/software/components/nagios/general" ?= NAGIOS_GENERAL_OPTIONS;


# Existing configuration files:
variable NAGIOS_EXTERNAL_FILES ?= null;

"/software/components/nagios/external_files" ?= NAGIOS_EXTERNAL_FILES;

# include apache setup (NAGIOS_CGI_OPTIONS)
variable NAGIOS_WEB_CONFIG ?= null;
include { NAGIOS_WEB_CONFIG };

variable NAGIOS_CGI_OPTIONS ?= null;
"/software/components/nagios/cgi" ?= NAGIOS_CGI_OPTIONS;

