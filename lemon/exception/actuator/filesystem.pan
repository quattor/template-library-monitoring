template monitoring/lemon/exception/actuator/filesystem;


include { 'components/filecopy/config' };

variable LEMON_ALARM_MAIL ?= undef;


###########################
variable CONTENTS = <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "Probleme NFS" ' +  LEMON_ALARM_MAIL;



"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/nfsnonok.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

###########################
variable CONTENTS= <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "/home is full" ' +  LEMON_ALARM_MAIL;


"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/homefull.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

################################################
###########################
variable CONTENTS= <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "/var is full" ' +  LEMON_ALARM_MAIL;


"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/varfull.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

################################################
###########################
variable CONTENTS= <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "/ is full" ' +  LEMON_ALARM_MAIL;


"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/rootfull.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

