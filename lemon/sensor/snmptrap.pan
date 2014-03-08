#
#
#
template monitoring/lemon/sensor/snmptrap;

"/system/monitoring/sensor/snmptrap/cmdline"="";# never previously defined 

"/system/monitoring/sensor/snmptrap/class"=list(
    nlist("name", "acsTrpAcsState",
          "descr","returns ACLS ACS State Information",
	      "field",list(nlist("name","identifier","format","%20s"),
                       nlist("name","state","format","%20s"),
                       nlist("name","status","format","%20s"),
                      )
         ),
    nlist("name", "acsTrpLsmState",
          "descr","returns ACLS LSM State Information",
	      "field",list(nlist("name","identifier","format","%20s"),
                       nlist("name","state","format","%20s"),
                       nlist("name","status","format","%20s"),
                      ),
         ),
    nlist("name", "acsTrpDriveState",
          "descr","returns ACLS Drive State Information",
	      "field",list(nlist("name","identifier","format","%20s"),
                       nlist("name","state","format","%20s"),
                       nlist("name","status","format","%20s"),
                      ),
         ),

    nlist("name", "acsTrpCapState",
          "descr","returns ACLS CAP State Information",
          "field",list(nlist("name","identifier","format","%20s"),
                       nlist("name","state","format","%20s"),
                       nlist("name","status","format","%20s"),
                       nlist("name","priority","format","%ld"),
                      ),
         ),

	nlist("name", "acsTrpInfo",
          "descr","returns ACLS Information",
          "field",list(nlist("name","message","format","%100s"),
                      ),
         ),
);





