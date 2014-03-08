template monitoring/ganglia/sensors/disk_io;

variable GANGLIA_DISK_IO_NAME = "/opt/ganglia/sensors/disk_io.sh";

# get disk list from hardware template
variable GANGLIA_DISK_IO_DISKS ?= {
    res = list();
    disks=value("/hardware/harddisks");
    foreach (disk; params; disks) {
        res[length(res)] = disk;
    };
    res;
};



variable GANGLIA_DISK_IO =<<EOF;
#!/bin/bash

# Original version by John Allspaw
# taken from http://www.mail-archive.com/ganglia-general@lists.sourceforge.net/msg02219.html

CLIENT="/usr/bin/gmetric"
TMPFILE="/tmp/disk-io.$1.tmp"
/usr/bin/iostat -x 4 2 $1 | grep -v ^$ | tail -4 > $TMPFILE
UTIL=`grep $1 $TMPFILE | awk '{print $14}'` 
WRITE=`tail -1 $TMPFILE | awk '{print $9}'`
READ=`tail -1 $TMPFILE | awk '{print $8}'`
IOWAIT=`head -2 $TMPFILE | tail -1 | awk '{print $4}'`
$CLIENT -t uint16 -n diskio.$1.util -v $UTIL -u '%'
$CLIENT -t uint16 -n diskio.$1.write -v $WRITE -u 'wkB/s'
$CLIENT -t uint16 -n diskio.$1.read -v $READ -u 'rkB/s'
$CLIENT -t uint16 -n diskio.$1.iowait -v $IOWAIT -u '%'  
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_DISK_IO_NAME),
        nlist("config",GANGLIA_DISK_IO,
              "owner","root",
              "perms","0755"));

variable GANGLIA_DISK_IO_COMMAND = {
    res="";
    foreach (k; disk; GANGLIA_DISK_IO_DISKS) {
        res = res+GANGLIA_DISK_IO_NAME+" "+disk+";";

    };
    res;
};

"/software/components/cron/entries" =
  push(nlist(
    "name","ganglia-disk-io",
    "user","root",
    "frequency", "*/1 * * * *",

    "command", GANGLIA_DISK_IO_COMMAND));

