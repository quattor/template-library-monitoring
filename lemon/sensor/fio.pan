#
# lemon-sensor-fio
#
template monitoring/lemon/sensor/fio;

"/system/monitoring/sensor/fio/cmdline"="/usr/bin/perl -I/usr/sue/dist/lib/sue -I/opt/edg/lib/perl -I/usr/libexec/sensors/ -MFIO /usr/libexec/sensors/edg-fmon-sensor.pl";

"/system/monitoring/sensor/fio/class"=list(
    nlist("name", "FIO::UnmountedSwaps",
          "descr","Number of swap devices in /etc/fstab that are not mounted",
	      "field",list(nlist ("name","UnmountedSwaps",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::UnmountedFilesystems",
          "descr","Returns the number of XFS or EXT* filesystems which are listed in /etc/fstab but not mounted.",
	      "field",list(nlist ("name","UnmountedFilesystems",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::FontService",
          "descr","Check if all necessary XFS daemons are running",
	      "field",list(nlist ("name","FontService",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::IsFileWriteable",
          "descr","Check if a file is writable - can be used to check if filesystems are mounted read/write",
	      "field",list(nlist ("name","IsFileWriteable",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::InstallTime",
          "descr","installation time",
          "field",list(nlist ("name","InstallTime",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::QuattorInstall",
          "descr","the name of the CDB type, pro_type_ template and  subcluster used at installation",
          "field",list(nlist ("name","CDBCLUSTER"   ,  "format", "%100s"),
                       nlist ("name","CDBTYPE"      ,  "format", "%100s"),
                       nlist ("name","CDBSUBCLUSTER",  "format", "%100s"),
                      ),
         ),
    nlist("name", "FIO::CpuBusy",
          "descr","Percentage of used CPU cycles between two samplings",
	      "field",list(nlist ("name","CpuBusy",  "format", "%.1f"),
                      ),
         ),
    nlist("name", "FIO::SpmaError",
          "descr","Check for errors in the SPMA log file",
	      "field",list(nlist ("name","SpmaError",  "format", "%ld"),
                      ),
         ),
    nlist("name", "FIO::CertExpDate",
          "descr","the expiry date of the nodes grid certificate",
	      "field",list(nlist ("name","CertExpDate",  "format", "%11s"),
                      ),
         ),
    nlist("name", "FIO::CertOK",
          "descr","check nodes grid certificate - Return 1 for ok, 0 for cert expiring today, -1 for problems",
	      "field",list(nlist ("name","CertOK",  "format", "%ld"),
                      ),
         ),
);





