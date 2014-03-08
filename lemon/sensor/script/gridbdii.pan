template monitoring/lemon/sensor/script/gridbdii;


include { 'components/filecopy/config' };


variable CONTENT_SM = <<EOF;
#!/usr/bin/perl -w

package GridBdii;

use strict;
# the sensor API interface
use sensorAPI;


# register module name and version
registerVersion("lemon-sensor-GridBdii", "1.01.1.7");

#
# register the sensors metric classes
#
registerMetric("GridBdii.BdiiStatus", "BDII status", "GridBdii::BdiiStatus");
registerMetric("GridBdii.BdiiLoad", "BDII Load", "GridBdii::BdiiLoad");
registerMetric("GridBdii.BdiiSlapd", "BDII slapd", "GridBdii::BdiiSlapd");




#<BdiiStatus> - BDII specific sensors to be used by Lemon monitoring
#<BdiiStatus> - returns >=0 if service is running, 1 if not


sub BdiiStatus_sample() {

	my $cmd="ldapsearch -x -h localhost -p 2170 -x -b o=grid";
	my $cmdout;
	my $cmdrc;
	my $rc=-1;
	my $obj  = shift;

		$cmdout=`$cmd 2>&1`;
		$cmdrc=$?;

		# 0 = all ok
		# != 0 error
		if ($cmdrc eq 0) {
			$rc=0;
		} else {
                        $rc=1;

		}
	 $obj->storeSample01($rc);

    return 0;
      }

sub BdiiLoad_sample (){

    my $searchcnt=0;
    my $obj  = shift;

    open(PS,"ps -C ldapsearch 2>&1 |");
    while(<PS>) {
        if (/ +ldapsearch/) {
                ++$searchcnt;
        }
    }
    close(PS);
           $obj->storeSample01($searchcnt);
  return 0;
}


sub BdiiSlapd_sample (){

    my $slapdcnt=0;
    my $obj  = shift;

    open(PS,"ps -C slapd 2>&1 |");
    while(<PS>) {
        if (/ +slapd/) {
                ++$slapdcnt;
        }
    }
    close(PS);
           $obj->storeSample01($slapdcnt);
  return 0;
}

1;


__END__


#-- End-of-File --------------------------------------------------------------------------------------#
EOF

##########
"/software/components/filecopy/services" = npush(
        escape("/usr/libexec/sensors/GridBdii.pm"),
        nlist("config",CONTENT_SM,
           	  "restart","/etc/init.d/edg-fmon-agent restart",
              "owner","root",
              "perms","0644")
    );

