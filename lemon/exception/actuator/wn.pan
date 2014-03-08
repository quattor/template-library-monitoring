template monitoring/lemon/exception/actuator/wn;


include { 'components/filecopy/config' };

variable LEMON_ALARM_MAIL ?= undef;


variable CONTENTS= <<EOF;
#!/bin/bash
A=$(for i in $(env | grep -i SW_DIR | cut -f 2 -d "="); do ls -ld $i | grep root ; done | wc -l)

echo $A

#if test $A -gt 0
#then
#EOF
#
#variable CONTENTS = CONTENTS + '  hostname | mail -s "probleme NFS" ' +  LEMON_ALARM_MAIL;
#
#variable CONTENTS = CONTENTS + <<EOF;
#
#fi
#
#
#/bin/df

EOF


"/software/components/filecopy/services" =
  npush(escape("/etc/lemon/actuator/nfs_test.sh"),
        nlist("config",CONTENTS,
              "owner","root:root",
              "perms","0755"));

