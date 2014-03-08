template monitoring/lemon/server/OraMon/service;

### LRF config
variable LRF_PHP_BACKEND = 'OraMon';

include { 'monitoring/lemon/server/OraMon/rpms/config' };

## oramon config file (replace with ncm-oramon??)
include { 'monitoring/lemon/server/OraMon/oramon' };

## set Oracle environment
include { 'monitoring/lemon/server/OraMon/oracle' };

## OraMon setup
include { 'monitoring/lemon/server/OraMon/lemon_oramon' };

