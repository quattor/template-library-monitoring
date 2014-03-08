############################################################
#
# template monitoring/lemon/metric/plcQuery
#
############################################################

template monitoring/lemon/metric/plcQuery;

"/system/monitoring/metric/_4321" = nlist(
	"name",	     "pdu",
	"descr",     "pdu power consumption data",
	"class",     "plc.PDU",
	"param",     list("server", "elplcms43.cern.ch",
  			  "port",     "502",
  			  "proto",    "tcp",
			  "EOD42*43", "150:30", 
			  "EOD43*43", "180:30",
			  "EOD44*43", "210:30",
			  "EOD45*43", "240:30",
			  "EOD46*43", "270:30",
			  "EOD47*43", "300:30",
			  "EOD48*43", "330:30",
			  "EOD49*43", "450:30",
			  "EOD50*43", "480:30",
		  	  "EOD51*43", "510:30",
		  	  "EOD52*43", "540:30",
			  "EOD53*43", "570:30",
			  "EOD54*43", "600:30",
			  "EOD55*43", "630:30",
			  "EOD56*43", "760:30",
			  "EOD57*43", "790:30",
			  "EOD58*43", "820:30",
			  "EOD59*43", "850:30",
			  "EOD60*43", "880:30",
			  "EOD61*43", "910:30",
			  "EOD62*43", "940:30",
			  "EOD63*43", "970:30",
			  "EOD64*43", "1000:30",
			  "EOD65*43", "1030:30",		
		     ),
	"period",    600,
	"active",    true,
	"latestonly",false,
);

"/system/monitoring/metric/_4322" = nlist(
	"name",      "power_consumption",
	"descr",     "power consumption per defined location",
	"class",     "plc.Summary",
    	"param",     list("CRITICAL",  "EOD48*43 EOD47*43 EOD54*43 EOD55*43 EOD56*43 EOD57*43 limit:250", 
			  "RHS",       "EOD49*43 EOD50*43 EOD51*43 EOD52*43 EOD53*43 EOD54*43 EOD55*43 limit:-1", 
			  "LHS_FRONT", "EOD56*43 EOD57*43 EOD58*43 EOD59*43 limit:-1", 
			  "LHS_BACK",  "EOD60*43 EOD61*43 EOD62*43 EOD63*43 EOD64*43 EOD65*43 limit:-1",
		 	  "UPS_1",     "EOD42*43 EOD43*43 EOD49*43 EOD50*43 EOD51*43 EOD52*43 EOD53*43 limit:-1",
			  "UPS_2",     "EOD44*43 EOD45*43 EOD54*43 EOD57*43 EOD58*43 EOD59*43 EOD60*43 limit:-1",
			  "UPS_3",     "EOD46*43 EOD47*43 EOD61*43 EOD62*43 EOD63*43 EOD64*43 EOD65*43 limit:-1",
			  "VAULT",     "EOD42*43 EOD43*43 EOD44*43 EOD45*43 EOD46*43 EOD47*43 EOD48*43 limit:-1",
			
			  # Aggregate of RHS, LHS_FRONT and LHS_BACK
			  "R-050",     "EOD49*43 EOD50*43 EOD51*43 EOD52*43 EOD53*43 EOD54*43 EOD55*43 EOD56*43 EOD57*43 EOD58*43 EOD59*43 EOD60*43 EOD61*43 EOD62*43 EOD63*43 EOD64*43 EOD65*43 limit:-1",
                     ),
	"period",    600,
	"active",    true,
	"latestonly",false,
);