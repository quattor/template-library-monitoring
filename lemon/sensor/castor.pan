#
#
#
template monitoring/lemon/sensor/castor;

"/system/monitoring/sensor/castor/cmdline"="/usr/bin/perl -I/opt/edg/lib/perl -MCastor /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/castor/class"=list(
    nlist("name", "Castor::MirStatus",
          "descr","the number of \"MIR is valid\" and \"MIR is invalid\" messages recorded in the last hour",
	      "field",list(nlist ("name","Valid",   "format", "%ld"),
                       nlist ("name","Invalid", "format", "%ld"),
                      )
         ),
    nlist("name", "Castor::MountCount",
          "descr","the number of mounted and dismounted tapes in the last hour",
	      "field",list(nlist ("name","Mounted",   "format", "%ld"),
                       nlist ("name","Dismounted","format", "%ld"),
                      ),
         ),
    nlist("name", "Castor::ChkDrvVidError",
          "descr","check the log for various error mesages, recorded in the last hour",
	      "field",list(nlist ("name","Castor::ChkDrvVidError","format", "%ld")
                      ),
         ),
    nlist("name", "Castor::ChkCableUnplugged",
          "descr","check for \"Cable is unplugged\" in /var/log/messages, in the last hour",
	      "field",list(nlist ("name","Castor::ChkCableUnplugged","format", "%ld"),
                      ),
         ),
    nlist("name", "Castor::ChkMsgdaemon",
          "descr","check for errors in the msgdaemon log files",
	      "field",list(nlist ("name","Castor::ChkMsgdaemon","format", "%ld"),
                      ),
         ),
    nlist("name", "Castor::ChkDriveConsistency",
          "descr","check consistency between contents of /etc/TPCONFIG and `mt -f /dev/nst* status`",
	      "field",list(nlist ("name","Castor::ChkDriveConsistency","format", "%ld"),
                      ),
         ),

);





