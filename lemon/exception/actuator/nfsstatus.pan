template monitoring/lemon/exception/actuator/nfsstatus;


include { 'components/filecopy/config' };

variable LEMON_ALARM_MAIL ?= undef;

###########################
variable CONTENTS = <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "NFS problem on the server check rpcinfo -p " ' +  LEMON_ALARM_MAIL;




"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/nfs_error.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

