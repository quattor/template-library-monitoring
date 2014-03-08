template monitoring/ganglia/sensors/maui_cpu_utilisation;

variable GANGLIA_MAUI_CPU_UTIL_NAME = "/opt/ganglia/sensors/maui_cpu_utilisation.sh";

variable GANGLIA_MAUI_CPU_UTIL =<<EOF;
#!/bin/bash

# Sending maui processor utilisation data to ganglia.
# Any args are passed as extra args to gmetric.

value=`showq|grep 'Processors Active'|awk -F'[()%]' '{print  $2}'`

gmetric -n maui_utilisation -v $value -t float -u Percent "$@"
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_MAUI_CPU_UTIL_NAME),
        nlist("config",GANGLIA_MAUI_CPU_UTIL,
              "owner","root",
              "perms","0755"));

"/software/components/cron/entries" =
  push(nlist(
    "name","ganglia-maui-cpu-util",
    "user","root",
    "frequency", "*/5 * * * *",

    "command", GANGLIA_MAUI_CPU_UTIL_NAME));

