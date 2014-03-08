template monitoring/lemon/sensor/maui;

# command line
"/system/monitoring/sensor/torque_maui/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl RunningJobs";


# class definitions
"/system/monitoring/sensor/torque_maui/class" = list(
	nlist("name", "torque_maui.RunningJobs", 
		"descr", "Running jobs and Waiting Jobs",
		"field", list(
			nlist("name", "Running_Jobs", "format", "%ld"),
			nlist("name", "Waiting_Jobs", "format", "%ld"),

		)
	),

);


# End-of-File
