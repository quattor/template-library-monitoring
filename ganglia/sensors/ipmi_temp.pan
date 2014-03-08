template monitoring/ganglia/sensors/ipmi_temp;

variable GANGLIA_IPMI_TEMP_NAME = "/opt/ganglia/sensors/ipmi_temp.sh";

variable GANGLIA_IPMI_TEMP =<<EOF;
#!/bin/bash

# Sending temperature data to Ganglia via ipmitool sensor readings.
# Any args are passed as extra args to gmetric.

# Dave Love <d.love@liv.ac.uk> / <fx@gnu.org>, 2008-07, public domain
# Modified by Stephen Childs <childss@cs.tcd.ie>, 2009-02

# Can be run from cron, for instance:
#  */5 * * * * root /usr/local/sbin/gmetric-temp -c $(awk '/^mcast_channel / {print $2}' /etc/gmond.conf)

# Avoid sending at the same time as all other nodes (modulo lack of
# synchronization of cron on each host and the slowness of ipmitool,
# which perhaps makes this irrelevant).
sleep $(($RANDOM / 1000))

ipmitool sdr type Temperature |

  # filter out non-readings, e.g.
  #  CPU 1            | 00h | ns  |  7.1 | No Reading
  grep 'degrees C' | grep 'Ambient' |

  # Initially collapsing multiple spaces helps the matching.
  # Then pick out the sensor name and value, separating them with |.
  # Temperatures always seem to be integer, but allow them to be float.
  sed -e 's/  */ /g' \
      -e "s/\([^|][^|]*\) |.* \([0-9.][0-9.]*\) degrees C$/\1|\2/" |

  while IFS='|' read name value; do
      # Ganglia (at least the ancient version we have) doesn't like
      # spaces in names -- substitute underscores.
      gmetric -n ${name// /_} -v $value -t float -u Celsius "$@"
  done
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_IPMI_TEMP_NAME),
        nlist("config",GANGLIA_IPMI_TEMP,
              "owner","root",
              "perms","0755"));

"/software/components/cron/entries" =
  push(nlist(
    "name","ganglia-ipmi-temp",
    "user","root",
    "frequency", "*/5 * * * *",

    "command", GANGLIA_IPMI_TEMP_NAME));

