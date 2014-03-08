############################################################ 
# 
# template monitoring/lemon/metric/snmptrapd
# 
############################################################ 

template monitoring/lemon/metric/snmptrapd; 

"/system/monitoring/metric/_4025" = nlist( 
"name", "snmptrapd", 
"descr", "snmptrapd daemon", 
"class", "system.numberOfProcesses", 
"param", list("name", "snmptrapd", "uid", "0", "ppid", "1"), 
"period", 300, 
"smooth", nlist("typeString", false, "maxdiff", 0.0, "maxtime", 600), 
"active", true, 
"latestonly", true, 
);