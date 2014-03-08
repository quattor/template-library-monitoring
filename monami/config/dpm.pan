unique template monitoring/monami/config/dpm;

variable MA_DPM_HEAD =<<EOF;
[dpm]
cache = 60
user = root
EOF

variable DPM_SERVICES = nlist("rfio", nlist("enabled",RFIO_ENABLED,"port", RFIO_PORT),
                              "dpm", nlist("enabled", SEDPM_SRM_SERVER,"port", DPM_PORT),
                              "dpns", nlist("enabled", SEDPM_SRM_SERVER,"port", DPNS_PORT),
                              "srmv1", nlist("enabled", SRMV1_ENABLED,"port", SRMV1_PORT),
                              "srmv2", nlist("enabled", SRMV2_ENABLED,"port", SRMV2_2_PORT),
                              "gridftp", nlist("enabled", GSIFTP_ENABLED,"port", GSIFTP_PORT),
);

variable MA_DPM_HEAD = MA_DPM_HEAD+"password = "+ SE_MYSQL_PASSWORD+"\n";

variable MA_DPM_HEAD = MA_DPM_HEAD + <<EOF;
 [mysql]
  user = root
EOF

variable MA_DPM_HEAD = MA_DPM_HEAD+"password = "+SE_MYSQL_PASSWORD+"\n";

variable MA_TCP_STATES=list("ESTABLISHED", "TIME_WAIT");

variable MA_DPM_HEAD = {
  

  res = SELF +"[tcp]\n";


  foreach (k; service; DPM_SERVICES) {
     if (service["enabled"]) {
       foreach (k1; state; MA_TCP_STATES) {
        res = res + format(" count = %s.in.%s [local_port=%d, state=%s]\n", k, to_lowercase(state), service["port"], state);
        };
     };

  };
  res;
};


variable MA_DPM_HEAD = MA_DPM_HEAD + <<EOF;
##
##  Samples
##

[sample]
 interval = 1m
 read = dpm
 write = ganglia

[sample]
 interval = 10s
 read = tcp
 write = ganglia

[sample]
 interval = 1m
 read = mysql.Network.Connections.current, \
 	mysql.Execution.Threads.running, \
 	mysql.Execution.Threads.cached, \
 	mysql.Execution.Temporary storage.files, \
 	mysql.Execution.Temporary storage.Tables.disk, \
 	mysql.Execution.Temporary storage.Tables.memory, \
 	mysql.Execution.Open.tables.current
 write = ganglia
[ganglia]
EOF

variable MA_DPM_DISK =<<EOF;
[tcp]
 count = rfio.in.established [local_port=5001, state=ESTABLISHED]
 count = rfio.in.time_wait   [local_port=5001, state=TIME_WAIT]
 count = gridftp.in.established [local_port=2811, state=ESTABLISHED]
 count = gridftp.in.time_wait   [local_port=2811, state=TIME_WAIT]

##
##  Samples
##

[sample]
 interval = 10s
 read = tcp
 write = ganglia

[ganglia]
EOF







variable MA_DPM_CONF = {

   if (SEDPM_SRM_SERVER) {
       MA_DPM_HEAD;
   } else {
       MA_DPM_DISK;
};

};

"/software/components/filecopy/services" =
  npush(escape("/etc/monami.d/dpm.conf"),
        nlist("config",MA_DPM_CONF,
              "owner","monami:monami",
              "perms","0600"));
