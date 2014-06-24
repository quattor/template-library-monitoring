unique template monitoring/ganglia/rpms/frontend-yd;

prefix '/software/packages';

'{ganglia}'        ?= nlist();
'{ganglia-web}'    ?= nlist();
'{ganglia-gmetad}' ?= nlist();
'{ganglia-gmond}'  ?= nlist();

'{httpd}'          ?= nlist();
'{mod_ssl}'        ?= nlist();
'{mod_php}'        ?= nlist();
