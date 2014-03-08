template monitoring/lemon/client/rpms/config;

# Determine OS flavour from NODE_OS_VERSION.
# To be considered SL4, version name must start with 'sl4'.
# Assume sl3 by default
variable LEMON_OS_FLAVOUR = {
  flavor = 'sl3';
  if ( exists(NODE_OS_VERSION) && is_defined(NODE_OS_VERSION) ) {
    if ( match(NODE_OS_VERSION, 'slc?[45]') ) {
      flavor = 'sl4';
    };
  };
  flavor;
};


include { return("monitoring/lemon/client/rpms/" + PKG_ARCH_DEFAULT + "/" + LEMON_OS_FLAVOUR); };