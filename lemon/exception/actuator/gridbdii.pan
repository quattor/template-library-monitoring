template monitoring/lemon/exception/actuator/gridbdii;


include { 'components/filecopy/config' };

variable LEMON_ALARM_MAIL ?= undef;

###########################
variable CONTENTS = <<EOF;
#!/bin/bash
EOF
variable CONTENTS = CONTENTS + 'hostname | mail -s "BDII not responding" ' +  LEMON_ALARM_MAIL;




"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/gridbdii_nonok.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

