unique template monitoring/ganglia/config;

include { 'monitoring/ganglia/service/variables' };

include {
  if  ((DB_IP[escape(FULL_HOSTNAME)] == GANGLIA_WEB_SERVER)||(FULL_HOSTNAME == GANGLIA_WEB_SERVER)) {
    'monitoring/ganglia/service/frontend';
  } else {
    'monitoring/ganglia/service/host';
  };
};

