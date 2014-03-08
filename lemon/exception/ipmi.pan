template monitoring/lemon/exception/ipmi;


"/system/monitoring/exception/_30302" = nlist(
	"name",      	"cputemperature_wrong",
	"descr",     	"cpu temperature has exceeded the upper or lower threshold",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
  	"alarmtext", 	"cputemperature_wrong",
	"correlation",	"((6100:1 > 0) && (6100:1 <= 10.0)) || (6100:1 >= 70.0) "
);


"/system/monitoring/exception/_30303" = nlist(
    "name",         "fanspeed_wrong",
    "descr",        "fan rotation speed of the chassis has exceeded the upper or the lower threshold",
    "active",       true,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "fanspeed_wrong",
    "correlation",  "((6101:1>0) && (6101:1 <= 500)) || (6101:1 >= 20000)"
);


"/system/monitoring/exception/_30304" = nlist(
    "name",         "voltage3_3_wrong",
    "descr",        "voltage 3.3V has exceeded the upper or the lower threshold ",
    "active",       false,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "voltage3_3_wrong",
    "correlation",  "6102:1>4"
);


"/system/monitoring/exception/_30305" = nlist(
    "name",         "system_board_hot",
    "descr",        "Motherboard too hot",
    "active",       false,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "system_board_hot",
    "correlation",  "(6103:1>44)"
);


"/system/monitoring/exception/_30306" = nlist(
    "name",         "fancount_wrong",
    "descr",        "One of the system or cpu fans have stopped",
    "active",       false,
    "latestonly",   false,
    "importance",   2,
    "alarmtext",    "fancount_wrong",
    "minoccurs",    4,
    "correlation",  "((6105:3<3 && 6105:3>0) || (6106:3<2 && 6106:3>0))"
);


"/system/monitoring/exception/_30537" = nlist(
        "name",         "ipmi_sel",
        "descr",        "Problem with the IPMI logging",
        "active",       false,	    # Too many errors
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ipmi_sel",
        "correlation",  "6104:3>=90 && 6104:4 ne 'OK'"
);


"/system/monitoring/exception/_30538" = nlist(
        "name",         "ipmi_power",
        "descr",        "Problem with the machine power supplies",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ipmi_power",
        "correlation",  "6104:3==82 && 6104:4 ne 'OK'"
);




"/system/monitoring/exception/_30539" = nlist(
        "name",         "ipmi_proc",
        "descr",        "Problem with the processor",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ipmi_proc",
        "correlation",  "6104:3==83 && 6104:4 ne 'OK'"
);



"/system/monitoring/exception/_30540" = nlist(
        "name",         "ipmi_wrong",
        "descr",        "Basic driver or BMC function failure",
        "active",       true,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ipmi_wrong",
        "correlation",  "6103:1==-5 || 6103:1==-4"
);



"/system/monitoring/exception/_30541" = nlist(
        "name",         "ipmi_no_contact",
        "descr",        "Cannot contact the BMC over the LAN",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "ipmi_no_contact",
	"minoccurs",    4,
        "correlation",  "6109:1>50"
);

