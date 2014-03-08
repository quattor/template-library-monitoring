template monitoring/lemon/sensor/script/maui;


include { 'components/filecopy/config' };


variable CONTENT_SM = <<EOF;
#!/usr/bin/perl -w


package torque_maui;

# modules
use diagnostics;
use strict;

# the sensor API interface
use sensorAPI;

# register module name and version
registerVersion("lemon-sensor-torque_maui", "1.0.0-1");

#
# register the sensors metric classes
#
registerMetric("torque_maui.RunningJobs", "report the Running Jobs", "torque_maui::RunningJobs");


sub RunningJobs_sample() {

    # All function hooks in the sensor API: _sample(), _initialise(), _periodicCheck(), _destroy()
    # are passed a hash as the first argument. This hash provides the function with the ability to
    # access the methods and variables of the metric instance/object. This is Perls implementation
    # of Object Orientation
    my $obj  = shift;

    # variables

    my $line = `/usr/bin/showq -r | echo \$((\$(wc -l)-4))`;
    my $line2 = `/usr/bin/showq -i | echo \$((\$(wc -l)-4))`;
    # showq -b only has two lines of header
    my $line3 = `/usr/bin/showq -b | echo \$((\$(wc -l)-2))`;
    my $value = sprintf("%d %d", $line, $line2+$line3);

            $obj->storeSample01($value);

    # All functions called by the sensor API must return a value
    #  - if the sampling was successful you the return code should be 0 and -1 on error


    return 0;
      }
1;


__END__


#-- End-of-File --------------------------------------------------------------------------------------#
EOF



"/software/components/filecopy/services" = npush(
        escape("/usr/libexec/sensors/RunningJobs.pm"),
        nlist("config",CONTENT_SM,
        	  "restart","/etc/init.d/edg-fmon-agent restart",
              "owner","root",
              "perms","0644")
    );
