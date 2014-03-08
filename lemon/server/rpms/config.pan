template monitoring/lemon/server/rpms/config;

variable LEMON_ARCH ?= PKG_ARCH_DEFAULT;
variable LEMON_OS_FLAVOUR ?= "sl4";

##  backend rpms
include { return("monitoring/lemon/server/"+LEMON_BACKEND+"/rpms/config"); };

## other lemon rpms
include { return("monitoring/lemon/server/rpms/"+LEMON_ARCH+"/"+LEMON_OS_FLAVOUR); };