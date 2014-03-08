structure template monitoring/nagios/services/token_atlasgrp;

include {"monitoring/nagios/services/slow-service"};

'service_description'='Occupation of token ATLASGRP';
'check_command'= list ('check_token', 'ATLASGRP');
