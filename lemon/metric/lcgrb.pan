############################################################
#
# template monitoring/lemon/metric/lcgrb
#
############################################################

template monitoring/lemon/metric/lcgrb;

include { 'monitoring/lemon/metric/wm' };

### Network Server Service
"/system/monitoring/metric/_5240/param" = list("cmdline", "/opt/edg/bin/edg-wl-ns_daemon", "uid", "edguser");### Ftpd Service
"/system/monitoring/metric/_5251/param" = list("cmdregex", "ftpd:.*");