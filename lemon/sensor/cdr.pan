#
#
#
template monitoring/lemon/sensor/cdr;

"/system/monitoring/sensor/cdr/cmdline"="";

"/system/monitoring/sensor/cdr/class"=list(
    nlist("name", "CDR_filetransfer",
          "descr","status of CDR file transfer: number + size of files transferred in last interval, awaiting transfer, and awaiting deletion",
	      "field",list(nlist ("name","TransferredCnt",     "format", "%ld", "unit", "Count", "scale", 1.0),
                           nlist ("name","TransferredVol",     "format", "%ld", "unit", "Bytes", "scale" ,1048576.0),
                           nlist ("name","TransferredRate",    "format", "%ld", "unit", "Bytes/s", "scale", 1048576.0),
                           nlist ("name","WaitForTransferCnt", "format", "%ld", "unit", "Count", "scale", 1.0),
                           nlist ("name","WaitForTransferVol", "format", "%ld", "unit", "Bytes", "scale", 1048576.0),
                           nlist ("name","WaitForDeletionCnt", "format", "%ld", "unit", "Count", "scale", 1.0),
                           nlist ("name","WaitForDeletionVol", "format", "%ld", "unit", "Bytes", "scale", 1048576.0),
                      )
         ),
);





