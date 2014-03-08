template monitoring/lemon/exception/sshd;


"/system/monitoring/exception/_30022" = nlist(
	"name",      	"ssh_wrong",
	"descr",     	"Ssh daemon wrong",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
   	"alarmtext", 	"sshd_wrong",
	"correlation",	"4006:1 < 1",
	"actuator", 	nlist("execve",  "/sbin/service sshd start",
			      "maxruns", 3,
		 	      "timeout", 0,
			      "active",  true)
);

