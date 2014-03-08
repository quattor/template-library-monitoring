# Template: monitoring/nagios/functions/hw_list Fuctions for listing and
# classifying nodes according to their hardware.
template monitoring/nagios/functions/hw_list;

# Returns each hardware structure available on the database given as
# an argumetn, as well as the nodes that have such hardware.
function list_hw = {

    db = ARGV[0];

    l = nlist();
    foreach (host; hw; db) {
	k = escape (hw);
	if (exists(l[k]["host_list"]) && is_defined(l[k]["host_list"])) {
	    debug ("Listing " + hw);
	    i = length(l[k]["host_list"]);
	} else {
	    i = 0;
	    l[k]["hardware_structure"] = create (hw);
	};
	l[k]["host_list"][i] = unescape (host);
    };
    l;
};

# Generates a structure with the lists of nodes in the cluster,
# classified by CPU and hardware template.
function generate_hw_structure = {

    db = ARGV[0];

    hw = list_hw (db);
    cpus = nlist();

    foreach (h; st; hw) {
	i = cores_in_hardware (st["hardware_structure"]);
	key = "_" + to_string (i);
	debug ("Hardware type: " + h);
	if (exists (cpus[key]) && is_defined (cpus[key])) {
	    debug ("Inserting " + key + " CPUs for " + h);
	    cpus[key] = merge (cpus[key], st["host_list"]);
	} else {
	    cpus[key] = st["host_list"];
	};
    };
    return (nlist ("per_hardware", hw,
		   "per_cpu", cpus));
};

# From now on, only a few example functions.

# Generates the check_load services for the entire
# cluster. Might need some tuning for localhost.
function generate_check_load_services = {

    hwlist = ARGV[0];

    srvs = nlist ();
    base = create (NAGIOS_LOAD_BASE_TEMPLATE);
    key = escape (base["service_description"]);
    base["service_description"] = null;
    srvs = nlist (key, list ());
    foreach (i; l; hwlist["per_cpu"]) {
	r = matches (i, '^_(\d+)$');
	n = to_long (r[1]);
        # Effectively, disable alarms on virtual hosts, which have no
        # physical CPUs.
	if (n == 0) {
	    n = 100;
	};
	srv = base;
	srv["check_command"][1] = to_string (n*2) + "," +
	    to_string (n*1.75) + "," + to_string (n*1.5);
	srv["check_command"][2] = to_string (n*3) + "," +
	    to_string (n*2) + "," + to_string (n*1.75);
	srv["host_name"] = l;
	srvs[key][length(srvs[key])] = srv;
    };
    srvs;
};

# Generates the host lists needed by the component.
function generate_plain_host_list = {

    listings = ARGV[0];
    
    l = nlist ();
    foreach (i; hl; listings["per_hardware"]) {
	foreach (j; host; hl["host_list"]) {
	    l[host] = create (NAGIOS_BASE_HOST,
			      "alias", host);
	};
    };
    return (l);  
};
