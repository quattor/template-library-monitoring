template monitoring/monami/config/torquemaui_ganglia;

variable MA_TM_GA =<<EOF;
# Monitor torque and maui
[torque]
cache = 60


# Maui doesn't seem to be working
[maui]
cache = 60
# need updated maui plugin (from CVS) to get password on x86_64
#password = 23071974

# write to ganglia
[sample]
 read = maui,torque
# read = torque
 write = ganglia
 interval = 1m

[ganglia]
EOF



"/software/components/filecopy/services" =
  npush(escape("/etc/monami.d/sched-ganglia.conf"),
        nlist("config",MA_TM_GA,
              "owner","monami:monami",
              "perms","0664",
              "backup",false));

"/software/components/chkconfig/service/monami/on" = "";
"/software/components/chkconfig/service/monami/startstop" = true;  