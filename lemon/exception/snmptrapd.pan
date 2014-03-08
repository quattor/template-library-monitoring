template monitoring/lemon/exception/snmptrapd;
 

"/system/monitoring/exception/_30128" = nlist( 
"name", "snmptrapd_wrong", 
"descr", "snmptrapd daemon wrong", 
"active", true, 
"latestonly", false, 
"importance", 2, 
"alarmtext", "snmptrapd_wrong", 
"correlation", "4025:1 < 1", 
"actuator", nlist("execve", "/etc/init.d/snmptrapd start", 
"maxruns", 3, 
"timeout", 0, 
"active", true) 
); 

