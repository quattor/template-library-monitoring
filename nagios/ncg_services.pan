template monitoring/nagios/ncg_services;

variable NAGIOS_SERVER_HOSTNAME?=HOSTNAME+'.'+SITE_DOMAIN;

variable SAM_ROOT_URL ?= "http://lcg-sam.cern.ch:8080/same-pi/";
variable SAM_RESULTS_URL ?= "https://lcg-sam.cern.ch:8443/sam/sam.py";

variable NCG_SITES ?= nlist(SITE_NAME, nlist("CE", list(CE_HOST),
					     "SE", SELIST,
					     "VOs", list("OPS","Atlas","LHCb")), 
		      );

# List of SE hosts for which SAM results are gathered
variable SELIST = {
    l = list();
    i = 0;
    foreach(se; setype; SE_HOSTS){
        if (match(se, SITE_DOMAIN)) {
                l[i] = se;
        };
    };

    return(l);
};

variable NCG_VOS ?= nlist("OPS", nlist("SAM_ROOT_URL", SAM_ROOT_URL,
				       "SAM_RESULTS_URL", SAM_RESULTS_URL),
			  "Atlas", nlist("SAM_ROOT_URL", SAM_ROOT_URL,
					 "SAM_RESULTS_URL", SAM_RESULTS_URL,
					 "CE_SERVICES", list("CE-sft-vo-swdir",
							     "CE-ATLAS-sft-lcg-tag",
							     "CE-sft-job"),
					 "SE_SERVICES", list("SRMv2-ATLAS-lcg-cr",
							     "SRMv2-ATLAS-lcg-del",
							     "SRMv2-ATLAS-lcg-cp")),
			  "LHCb", nlist("SAM_ROOT_URL", SAM_ROOT_URL,
					"SAM_RESULTS_URL", SAM_RESULTS_URL,
					"CE_SERVICES", list("CE-sft-csh",
							    "CE-sft-vo-swdir",	
					                    "CE-sft-job"),
					"SE_SERVICES", list()),
			 );

variable DEFAULT_CE_SERVICES = list("CE-sft-job",
				    "CE-sft-softver",
				    "CE-sft-brokerinfo",
				    "CE-sft-caver",
				    "CE-host-cert-valid",
				    "CE-sft-lcg-rm",
				    "CE-sft-csh",
				    "APEL-pub",
				    "sBDII-performance",
				    "sBDII-sanity");

variable DEFAULT_SE_SERVICES = list("SRMv2-gt",
			      	    "SRMv2-get-SURLs",
				    "SRMv2-get",
				    "SRMv2-del",
				    "SRMv2-put",
				    "SRMv2-ls",
				    "SRMv2-host-cert-valid",
				    "SRMv2-ls-dir");

variable NCG_SERVICES = {
    ncg_services = nlist();
    services = nlist();
    servicegroups = nlist();

    foreach(site; site_info; NCG_SITES){
		debug("Site: " + site);
			foreach(site_vos; vo; site_info["VOs"]){
				if(exists(NCG_VOS[vo])){
					debug("Generating service definitions");
					ce = site_info["CE"];
					se = site_info["SE"];
					
					if(is_defined(NCG_VOS[vo]["CE_SERVICES"])) {
						ce_services = NCG_VOS[vo]["CE_SERVICES"];
						se_services = NCG_VOS[vo]["SE_SERVICES"];
					} else {
						ce_services = DEFAULT_CE_SERVICES;
                                                se_services = DEFAULT_SE_SERVICES;
					};
					services["SAM_Gather-"+site+"-"+vo] = list(
                                                                create("monitoring/nagios/services/SAM_Gather",
                                                                        "service_description","SAM_Gather-"+site+"-"+vo,
                                                                        "check_command",list("ncg_gather_gi_sam",
                                                                                NCG_VOS[vo]["SAM_ROOT_URL"],site,vo)
                                                                      )
                                        );

					base_srv = create("monitoring/nagios/services/passive-service");

					foreach(group_service; service; ce_services){
					servicename = service+"-"+vo;
					debug("Service: " + servicename); 
							srv = merge(base_srv, nlist(
								    "host_name", ce,
                                                                    "servicegroups",list("remote","SAM",vo),
                                                                    "check_command",list("ncg_check_passive"),
								    "notes_url", NCG_VOS[vo]["SAM_RESULTS_URL"]
                                						+ "?funct=TestResultLatest&nodename=$HOSTNAME$"
                                						+ "&vo=" + vo + "&testname=" + service
								)
							);

							if(is_defined(services[servicename])){
								services[servicename][length (services[servicename])] = srv;
							} else {
            							services[servicename] = list (srv);
        						};
					};
					
					foreach(group_service; service; se_services){
					servicename = service+"-"+vo;
                                        debug("Service: " + servicename);        
							srv = merge(base_srv, nlist(
                                                                    "host_name", se,
                                                                    "servicegroups",list("remote","SAM",vo),
								    "check_command",list("ncg_check_passive"),
								    "notes_url", NCG_VOS[vo]["SAM_RESULTS_URL"]
                                                                                + "?funct=TestResultLatest&nodename=$HOSTNAME$"
                                                                                + "&vo=" + vo + "&testname=" + service
                                                        	)
							);

							if(is_defined(services[servicename])){
                                                                services[servicename][length (services[servicename])] = srv;
                                                        } else {
                                                                services[servicename] = list (srv);
                                                        };
                                        };					
				};
			};
    };

    foreach(vo; vo_info; NCG_VOS) {
	servicegroups[vo]= nlist("alias", vo);
    };	

    ncg_services = nlist("SERVICES", services,
                     "GROUPS", servicegroups);

    ncg_services;
};

variable NAGIOS_EXPLICIT_SERVICES = {
    if (is_defined(SELF)) {
        res=SELF;

    }
    else {
        res=nlist();
    };
    res=merge(res,NCG_SERVICES["SERVICES"]);
    res;
};

variable NAGIOS_EXPLICIT_SERVICEGROUPS = {
    if (is_defined(SELF)) {
        res=SELF;

    }
    else {
        res=nlist();
    };
    res=merge(res,NCG_SERVICES["GROUPS"]);
    res;
};
