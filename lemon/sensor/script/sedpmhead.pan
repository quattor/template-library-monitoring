template monitoring/lemon/sensor/script/sedpmhead;


include { 'components/filecopy/config' };


variable CONTENT_SM = <<EOF;
#!/usr/bin/perl -w

package DpmHead;

use strict;
# the sensor API interface
use sensorAPI;

# register module name and version
registerVersion("lemon-sensor-DpmHead", "1.01.1.1");

#
# register the sensors metric classes
#
registerMetric("DpmHead.DpmPool", "Pool state", "DpmHead::DpmPool");


#SPM POOL state
#################
sub DpmPool_sample() {

        my $obj  = shift;

        my $name;
        my $pool;
        my $poolname;
        my $num;
        my $value;

                foreach $name (`/opt/lcg/bin/dpm-qryconf | grep POOL | cut -d " " -f1,2,3`) {

                        $num = `/opt/lcg/bin/dpm-qryconf |grep -A 1 "$name" | grep % | grep -v / | cut -d "%" -f1 | cut -d "(" -f2`;
                        $pool= `echo "$name"  | cut -d " " -f 2`;

                my $poolname =`echo "$pool" | tr -d '\n'`;
                my $poolnum =`echo "$num" | tr -d ' '`;
                my $poolint =int($poolnum);

                        $value = sprintf("%s %d", $poolname, $poolint);

                        $obj->storeSample01($value);
                }

    return 0;
 }

1;


__END__


#-- End-of-File --------------------------------------------------------------------------------------#
EOF

##########
"/software/components/filecopy/services" = npush(
        escape("/usr/libexec/sensors/DpmHead.pm"),
        nlist("config",CONTENT_SM,
        	  "restart","/etc/init.d/edg-fmon-agent restart",
              "owner","root",
              "perms","0644")
    );

