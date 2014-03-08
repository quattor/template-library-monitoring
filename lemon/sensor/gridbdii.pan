template monitoring/lemon/sensor/gridbdii;

# command line
"/system/monitoring/sensor/gridbdii/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl GridBdii";


# class definitions
"/system/monitoring/sensor/gridbdii/class" = list(
	nlist("name", "GridBdii.BdiiStatus", 
		"descr", "BDII status",
		"field", list(
			nlist("name", "BdiiStatus", "format", "%ld"),

		)
	),
        nlist("name", "GridBdii.BdiiLoad",
                "descr", "BDII Load",
                "field", list(
                        nlist("name", "BdiiLoad", "format", "%ld"),

                )
        ),
        nlist("name", "GridBdii.BdiiSlapd",
                "descr", "BDII Slapd number of process equal 3?",
                "field", list(
                        nlist("name", "BdiiSlapd", "format", "%ld"),

                )
        ),


);


# End-of-File
