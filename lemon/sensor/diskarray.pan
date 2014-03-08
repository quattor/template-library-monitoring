#
#
#
template monitoring/lemon/sensor/diskarray;

"/system/monitoring/sensor/diskarray/cmdline"="";# never previously defined 

"/system/monitoring/sensor/diskarray/class"=list(
    nlist("name", "iftCtlrEventTrapAlert",
          "descr","returns infortrend diskarray Alerts",
	      "field",list(nlist("name","message","format","%100s"),
                      )
         ),
    nlist("name", "iftCtlrEventTrapWarning",
          "descr","returns infortrend diskarray Warnings",
	      "field",list(nlist("name","message","format","%100s"),
                      ),
         ),
    nlist("name", "iftCtlrEventTrapNotification",
          "descr","returns infortrend diskarray Notifications",
	      "field",list(nlist("name","message","format","%100s"),
                      ),
         ),

);


