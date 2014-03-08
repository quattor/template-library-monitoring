template monitoring/lemon/server/OraMon/rpms/config;

variable LEMON_ARCH ?= PKG_ARCH_DEFAULT;
variable LEMON_OS_FLAVOUR ?= "sl4";
variable ORACLE_XE_LOCAL_INSTALL ?= true;

include { return("monitoring/lemon/server/OraMon/rpms/"+LEMON_ARCH+"/" + LEMON_OS_FLAVOUR); };
include { 
	if (ORACLE_XE_LOCAL_INSTALL) {
		return("monitoring/lemon/server/OraMon/rpms/"+LEMON_ARCH+"/oracle_xe");
	} else {
		return(null);
	}
};