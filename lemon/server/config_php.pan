template monitoring/lemon/server/config_php;


# ---------------------------------------------------------------------------- 
# filecopy
# ---------------------------------------------------------------------------- 
include { 'components/filecopy/config' };

variable LRF_BACKEND ?= LEMON_BACKEND;

## addional environment settings (has to be set in the backend config)
variable LRF_PHP_ENV ?= '';
## authentication string (has to be set in the backend config)
variable LEMON_PHP_AUTH ?= '';

############ Description PHP ################
#  /var/www/html/lrf/config.php

variable CONTENTS_PHP = <<EOF;
<?php
$ROOT = "/var/www/html/lrf";
$RRD_DATA = "/var/www/html/lrf/data";
$RRD_IMAGES = "$ROOT/images";
$RRD_IMAGES_PREFIX = "/lrf/images/";
global $RRD_DATA,$RRD_IMAGES,$RRD_IMAGES_PREFIX;
$RRDTOOL_PATH="/usr";
$CLUSTER_INFO = "/etc/lemon/lrf/clusters.conf";
$CDB_CLUSTER_INFO = "";
$RACK_INFO = "";
$HWMODEL_INFO = "";
$POWER_INFO = "";
$VO_INFO = "";
$DB_INFO = "";
$ITCM = "";  // info which database to use for the ticket database
$ERROR_TRENDING_ENABLE = "no";
EOF

variable CONTENTS_PHP = CONTENTS_PHP + '$BACKEND = "'+LRF_PHP_BACKEND+"\";\n";

variable CONTENTS_PHP = CONTENTS_PHP + <<EOF;
$PROFILE_AREA = "";
$CC_DESCRIPTION = "";
$DEFAULT_TYPE="cluster";
$DEFAULT_VALUE="GRID_SERVICES";
$ENTRY = array( 0 => array("GRID_SERVICES","workernode","GRID_SERVICES"),
		1 => array("WN","workernode","WN"));
//              2 => array("my_fileserver_cluster","fileserver","Fileserver services"),
//              3 => array("my_tapeserver_cluster","tapeserver","Tapeserver services"));
EOF

variable CONTENTS_PHP = CONTENTS_PHP + LRF_PHP_ENV + "\n";
variable CONTENTS_PHP = CONTENTS_PHP + '$databases = array('+LEMON_PHP_AUTH + ");\n";
variable CONTENTS_PHP = CONTENTS_PHP + <<EOF;
?>
EOF
###############################################
"/software/components/filecopy/services" =
  npush(escape("/var/www/html/lrf/config.php"),
        nlist("config",CONTENTS_PHP,
              "owner","apache",
              "perms","0600"));

###############################################
