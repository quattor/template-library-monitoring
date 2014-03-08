unique template monitoring/nagios/nsca/OCP_daemon;

# create the script to submit check results to the master

variable OCP_DAEMON_SCRIPT = <<EOF;
#!/usr/bin/perl
# OCP_daemon - Obsessive Compulsive Host/Service Processor daemon for Nagios
#
# Copyright (C) 2007 Thomas Guyot-Sionnest <tguyot@gmail.com>
# Original code Copyright (C) 2006, 2007 Mark Steele
#       http://www.control-alt-del.org/code
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
use Event::Lib;
use Getopt::Std;
use POSIX;
use strict;
use warnings;
use vars qw($PROGNAME $VERSION $READ_SIZE $MAX_LINE_LENGTH $CHILD_TIMEOUT %args);

#####################################################################
#
$PROGNAME = 'OCP_daemon';
$VERSION = '1.0rc4';
#
# Try to get that much data each read. Normally a named pipe
# can't hold more that 4096 bytes.
$READ_SIZE = 4096;
#
# A line longer than this will be discarded.
$MAX_LINE_LENGTH = 8192;
#
# How long to wait for send_nsca. If you're sending huge batch
# updates on a very slow network you'll likely want to increase this.
$CHILD_TIMEOUT = 60;
#
#####################################################################

# Ignore HUPs in case we've been lazily started from the shell
$SIG{HUP} = 'IGNORE';

getopts("f:n:H:p:t:c:r:m:h", \%args);

# Print usage if missing options or -h
if (!$args{'f'} || !$args{'H'} || $args{'h'}) {
  if (!$args{'h'}) {
    print "You must specify at least one pipe to read\n" unless ($args{'f'});
    print "You must specify the host to send data to\n" unless ($args{'H'});
  }
  usage();
}

# Process options
my @fifos = split (/,/, $args{'f'});
my $reaper_delay = $args{'r'} || 1;
my $max_queue = $args{'m'} || 0;

# Construct send_nsca command
my $nsca = $args{'n'} || '/usr/local/nagios/bin/send_nsca';
$nsca .= " -H $args{'H'}";
$nsca .= " -p $args{'p'}" if $args{'p'};
$nsca .= " -to $args{'t'}" if $args{'t'};
$nsca .= " -c $args{'c'}" if $args{'c'};

# Sanity checks
if ($reaper_delay !~ /^\d+$/) {
  print "reaper_delay must be an integer greater or equal to 0!\n\n";
  usage();
}

if ($max_queue !~ /^\d+$/) {
  print "max_queue must be an integer greater or equal to 0!\n\n";
  usage();
}

$max_queue = 0 unless ($reaper_delay);

# send_nsca test run
system ("$nsca </dev/null >/dev/null 2>/dev/null");
if ($? != 0) {
  print "Failed to run '$nsca', bailing out!\n";
  exit 1;
}

# Now the fun stuff :)

$0 = $PROGNAME;

# Set up a zombie reaper
my $signal = signal_new(SIGCHLD, \&reap_chld);
$signal->add;

my @queue;

## VERY IMPORTANT: You have to open the pipe in O_RDWR, POSIX has rules about 
##                 using polling calls on pipes, and can't do any on O_RDONLY
##
foreach my $fifo (@fifos) {
  die "$fifo is not a pipe!" unless (-p $fifo);
  sysopen(my $FIFO, $fifo, O_RDWR | O_NONBLOCK) || die "couldn't open $fifo: $!";
  my $reader = event_new(\*$FIFO, EV_READ, \&reader);
  $reader->add;
}

my $timer;
if ($reaper_delay) {
  $timer = timer_new(\&reaper);
  $timer->add($reaper_delay);
}

event_mainloop();

sub reap_chld {
  while (waitpid(-1, WNOHANG) > 0) {
  }
}

sub reaper {
  my $event = shift;

  if (@queue) {
    my $fork;
    if (($fork = fork) == 0) {
      # We're a child, make sure we don't stay around too long...
      alarm($CHILD_TIMEOUT);
      $0 = "$0 child";

      open(NSCA, "|$nsca >/dev/null 2>/dev/null") or die "Failed to spawn send_nsca: $!";
      print NSCA @queue;
      close(NSCA);
      exit;

    } elsif (!defined ($fork)) {
      # Fork failed, no free resources?
      die "Fork failed, no free resources?"
    } else {
      # We're the parent, empty the queue
      undef @queue;
    }
  }
  # Reschedule ourself if we're using the timer.
  $event->add($reaper_delay) if ($event);
}


sub reader {
  my $event = shift;
  my $fh = $event->fh;
  my $self = shift;
  my $data;

  if (scalar($event->args()) > 3) { ## Recursively called ourselves with data passed to function
    $data = $_[3];
  }

  my $ret = sysread ($fh, my $buf, $READ_SIZE);

  if (defined ($ret) && $ret == 0) { ## Shouldn't happen
    #print scalar localtime, " ACK: Got EOF?\n";
    die;
  } elsif (!defined ($ret)) { ## Shouldn't happen
    #print scalar localtime, " ACK: Error condition? $!\n";
    die;
  } elsif (!$buf) { ## Shouldn't happen
    #print scalar localtime, " ACK: Not EOF, not error, but nothing in buffer\n";
    die;
  }

  # 
  # Be safe here...
  $data .= $buf;
  while (my $marker = index ($data, "\n") + 1) {
    push (@queue, substr ($data, 0, $marker));
    $data = substr ($data, $marker);
      
    if ($max_queue && $max_queue <= @queue) {
      $timer->remove; # Reaper will re-add itself
      reaper($timer);
    }
  }

  # Process queue now if there's no timer
  reaper(0) unless ($reaper_delay);

  if ($data && length ($data) < $MAX_LINE_LENGTH) {   ## Incomplete line
    #print "DATA LEFT AFTER PARSING: ------------\n$data\n-------------\n";
    $event->args($event->fh, EV_READ, $self, $data);
    $event->add;
    return;
  }

  $event->args($event->fh, EV_READ, $self);
  $event->add;
}

sub usage {
  print "$PROGNAME v.$VERSION - Obsessive Compulsive Host/Service Processor daemon\n";
  print "Usage:\n";
  print "  $PROGNAME -f <fifo>[,<fifo2>[,<fifoN>...]] -H <nsca_host> [ -n <nsca_bin> ]\n";
  print "  [ -p <nsca_port> ] [ -t <nsca_timeout> ] [ -c <nsca_config> ]\n";
  print "  [ -r <reaper_delay> ] [ -m <max_queue> ]\n\n";

  print "Options:\n";
  print "  -f <fifo>\tComma-separated list of fifo files to read from\n";
  print "\t\tThese files must be all named pipes (fifo)\n\n";

  print "  -n <nsca_bin>\tsend_nsca command path\n";
  print "\t\tDefaults to /usr/local/nagios/bin/send_nsca\n\n";

  print "  -H,-p,-t,-c\tSee corresponding send_nsca command\n\n";

  print "  -r <seconds>\tHow long to wait between each nsca flushes\n";
  print "\t\t0 = as data arrive. Default: 1 second\n";
  print "\t\tWARNING: Setting this to 0 can be very resource-consuming!\n\n";

  print "  -m <slots>\tMax queue size if reaper_delay is greater than 0\n";
  print "\t\tA flush will be forced if the queue reach this size\n\n";

  exit 1;
}
EOF


variable OCP_DAEMON_INITD = <<EOF;
#!/bin/sh
# chkconfig: 2345 98 01
# description: Efficiently push Nagios check results via NSCA to Nagios master server

if [ -f /etc/sysconfig/OCP_daemon ] ; then
   . /etc/sysconfig/OCP_daemon
fi

DIR=${DIR:-/var/nagios/rw}
DAEMON=${DAEMON:-/usr/local/sbin/OCP_daemon}
PID_FILE=${PID_FILE:-/var/run/OCP_daemon.pid}
SEND_NSCA=${SEND_NSCA:-/usr/sbin/send_nsca}
NSCA_CONFIG=${NSCA_CONFIG:-/etc/nagios/send_nsca.cfg}

if [ -z "$NSCA_HOST" ]; then
    echo "Error: mandatory variable $NSCA_HOST is undefined" >&2
    exit 1
fi

start() {
    for name in host-perfdata.fifo service-perfdata.fifo ; do
        fifo=$DIR/$name
        if [ ! -p "$fifo" ]; then
            mkfifo $fifo
            chgrp nagios $fifo
            chmod 0660 $fifo
        fi
    done

    if [ ! -f "$NSCA_CONFIG" ]; then
        echo "Error: cannot find file $NSCA_CONFIG" >&2
        exit 1
    fi

    for exec in $DAEMON $SEND_NSCA ; do
        if [ ! -f $exec -o ! -x $exec ]; then
            echo "Error: cannot execute $exec" >&2
            exit 1
        fi
    done


    if [ ! -f "$PID_FILE" ]; then
        $DAEMON -f $DIR/host-perfdata.fifo,$DIR/service-perfdata.fifo -n $SEND_NSCA \
                -H $NSCA_HOST -c $NSCA_CONFIG -r 1 &
        pid=$!
        echo $pid > $PID_FILE
    fi
}


stop() {
    if [ -f "$PID_FILE" ]; then
        kill $(cat $PID_FILE)
	/bin/rm -f "$PID_FILE"
    else
        echo "OCP_daemon is not running" >&2
    fi
}

restart() {
    stop
    start
}

status() {
    if [ -f "$PID_FILE" ]; then
        echo "OCP_daemon is running with PID="$(cat $PID_FILE)
    else
        echo "OCP_daemon is not running"
    fi
}

case $1 in
	start)		start;;
	stop)		stop;;
	status)		status;;
	restart)	restart;;
esac

exit 0


EOF


include { 'components/filecopy/config' };
"/software/components/filecopy/services" = npush(
    escape("/usr/local/sbin/OCP_daemon"),
        nlist("config",OCP_DAEMON_SCRIPT,
              "backup", false,
              "perms","0755"),
    escape("/etc/init.d/OCP_daemon"),
        nlist("config",OCP_DAEMON_INITD,
              "backup", false,
              "perms","0755"),
);

include { 'components/chkconfig/config' };
"/software/components/chkconfig/service/OCP_daemon/on" = "";
