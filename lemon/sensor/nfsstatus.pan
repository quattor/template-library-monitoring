template monitoring/lemon/sensor/nfsstatus;

# command line
"/system/monitoring/sensor/nfsstatus/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl NfsStatus";


# class definitions
"/system/monitoring/sensor/nfsstatus/class" = list(
	nlist("name", "NfsStatus.Calls", 
		"descr", "Bad calls/ calls",
		"field", list(
			nlist("name", "Calls", "format", "%.2f"),

		)
	),
        nlist("name", "NfsStatus.PacketLost",
                "descr", "Packet Lost",
                "field", list(
                        nlist("name", "PacketLost", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.Threads",
                "descr", "the last 4 thread were 100% busy during this time",
                "field", list(
                        nlist("name", "Threads", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.RpcPortmap",
                "descr", "Portmap running ? ",
                "field", list(
                        nlist("name", "RpcPortmap", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.RpcNlockmgr",
                "descr", "nlockmgr running ? ",
                "field", list(
                        nlist("name", "RpcNlockmgr", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.RpcRquotad",
                "descr", "rquotad running ? ",
                "field", list(
                        nlist("name", "RpcRquotad", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.RpcMountd",
                "descr", "mountd running ? ",
                "field", list(
                        nlist("name", "RpcMountd", "format", "%ld"),

                )
        ),
        nlist("name", "NfsStatus.RpcNfs",
                "descr", "nfs running ? ",
                "field", list(
                        nlist("name", "RpcNfs", "format", "%ld"),

                )
        ),



);


# End-of-File
