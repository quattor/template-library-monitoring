template monitoring/lemon/server/OraMon/oracle;

## GRIF: was ccora10gtaf.in2p3.fr
variable ORAMON_ORACLE_DATABASE_NAME ?= 'XE';
variable ORACLE_HOME ?= '/usr/lib/oracle/xe/app/oracle/product/10.2.0/server';
variable ORACLE_XE_LOCAL_INSTALL ?= true;

include { 
	if (ORACLE_XE_LOCAL_INSTALL) {
		return("monitoring/lemon/server/OraMon/oracle_xe_local_install");
	} else {
		return(null);
	}
};
# ----------------------------------------------------------------------------
# filecopy
# ----------------------------------------------------------------------------
include { 'components/filecopy/config' };


## Environnement Oracle
## for local installs, this equals $ORACLE_HOME/bin/oracle_env.sh
######################

variable CONTENTS_ORACLE_ENV = "ORACLE_HOME=" + ORACLE_HOME + "\n";
variable CONTENTS_ORACLE_ENV = CONTENTS_ORACLE_ENV + <<EOF;
export ORACLE_HOME
EOF
variable CONTENTS_ORACLE_ENV = CONTENTS_ORACLE_ENV + "ORACLE_SID=" + ORAMON_ORACLE_DATABASE_NAME + "\n";
variable CONTENTS_ORACLE_ENV = CONTENTS_ORACLE_ENV + <<EOF;
export ORACLE_SID
NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export NLS_LANG
PATH=$ORACLE_HOME/bin:$PATH
export PATH
if [ $?LD_LIBRARY_PATH ]
then
        LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
else
        LD_LIBRARY_PATH=$ORACLE_HOME/lib
fi
export LD_LIBRARY_PATH
export TNS_ADMIN=$ORACLE_HOME/network/admin
EOF

# description des servers
# example for remote DB
#############################
variable CONTENTS_ORACLE_TNS ?= <<EOF;
# tnsnames.ora Network Configuration File:
ccora10gtaf.in2p3.fr =
   (DESCRIPTION =
     (ADDRESS=(PROTOCOL=TCP)(HOST=ccdbcl01.in2p3.fr)(PORT=1521))
     (ADDRESS=(PROTOCOL=TCP)(HOST=ccdbcl02.in2p3.fr)(PORT=1521))
     (LOAD_BALANCE=yes)
     (CONNECT_DATA=
          (SERVER=DEDICATED)(SERVICE_NAME=ccora10gtaf.in2p3.fr)
          (FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)
          (RETRIES=180)(DELAY=5))
    )
  )
EOF


###############################################
"/software/components/filecopy/services" = 
  npush(escape("/etc/profile.d/oracle_env.sh"),
        nlist("config",CONTENTS_ORACLE_ENV,
              "owner","root",
              "perms","0755"));


###############################################
###############################################
"/software/components/filecopy/services" = {
	if (ORACLE_XE_LOCAL_INSTALL) {
		## default is ok
		return(SELF);
	} else {
	  npush(escape(ORACLE_HOME+"/network/admin/tnsnames.ora"),
		nlist("config",CONTENTS_ORACLE_TNS,
              "owner","oracle",
              "perms","0444"));
	};
};

###############################################
## fix httpd environment
## httpd oracle load environment
variable CONTENTS = <<EOF;
. /etc/profile.d/oracle_env.sh


EOF
"/software/components/filecopy/services" =
  npush(escape("/etc/sysconfig/httpd"),
        nlist("config",CONTENTS,
              "restart","/etc/init.d/httpd restart",
              "perms","0644"));
              
