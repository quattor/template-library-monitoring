template monitoring/lemon/exception/system_state;


"/system/monitoring/exception/_30001" = nlist(
	"name",      	"kernel_panic",
	"descr",     	"kernel panic",
	"active",    	true,
	"latestonly",	false,
	"importance",	3,
    	"alarmtext", 	"kernelPanic",
	"correlation",	"5121:1 != 0",
);




"/system/monitoring/exception/_30002" = nlist(
	"name",      	"iss_nologin",
	"descr",     	"iss_nologin present on the machine",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"iss_nologin",
	"correlation",	"5004:1 != -1",
	"offset",	"300"
);




"/system/monitoring/exception/_30041" = nlist(
	"name",      	"nonwriteable_filesystems",
	"descr",     	"Non writeable file systems detected",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext", 	"nonwriteable_filesystems",
	"correlation",	"((9104:3 regex 'rw') && (9104:9 != 1))"
);


"/system/monitoring/exception/_30099" = nlist(
	"name",      	"unmounted_filesystems",
	"descr",     	"Unmounted filesystems exist",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext", 	"UnmountedFilesystems",
	"correlation",	"20047:1 > 0"
);




"/system/monitoring/exception/_30006" = nlist(
	"name",      	"crashdump",
	"descr",     	"Crashdump found",
	"active",    	true,
	"latestonly",	false,
	"importance", 	1,
	"alarmtext", 	"CrashDump_found",
	"correlation",	"((20044:1 > 0) && (20044:1 != -1))"
);




"/system/monitoring/exception/_30007" = nlist(
	"name",      	"vm_kill",
	"descr",     	"Processes killed because of memory problems",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"VM_kill",
	"correlation",	"5122:1 != 0"
);




"/system/monitoring/exception/_30008" = nlist(
	"name",      	"high_load",
	"descr",     	"Load exceeded allowed maximum",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext", 	"high_load",
	"correlation",	"20002:1 > 16",
	"minoccurs",	10
);




"/system/monitoring/exception/_30009" = nlist(
	"name",      	"swap_full",
	"descr",     	"Swap utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"correlation",	"20003:1 > 95"
);


"/system/monitoring/exception/_30010" = nlist(
	"name",      	"tmp_full",
	"descr",     	"Tmp utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext", 	"tmp_full",
	"correlation",	"((9104:1 eq '/tmp') && (9104:5 > 90))",
	"actuator", 	nlist("execve",  "/usr/local/sbin/clean-tmp-partition -o 75",
			      "maxruns", 3,
			      "timeout", 0,
			      "active",  false)
);


"/system/monitoring/exception/_30011" = nlist(
	"name",      	"var_full",
	"descr",     	"Var utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	3,
	"alarmtext", 	"var_full",
	"correlation",	"((9104:1 eq '/var') && (9104:5 > 90))"
);


"/system/monitoring/exception/_30012" = nlist(
	"name",      	"root_full",
	"descr",     	"Root utilization exceeds limit",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext", 	"root_fs_full",
	"correlation",	"((9104:1 eq '/') && (9104:5 > 90))"
);


"/system/monitoring/exception/_30134" = nlist(
        "name",         "data_full",
        "descr",        "Data partition utilization exceeds limit",
        "active",       false,
        "latestonly",   false,
        "importance",   2,
        "alarmtext",    "data_full",
        "correlation",  "((9104:1 eq '/data') && (9104:5 > 90))"
);




"/system/monitoring/exception/_30070" = nlist(
	"name",      	"no_login",
	"descr",     	"/etc/nologin present",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"alarmtext",	"no_login",
	"correlation",	"5003:1 != -1"
);




"/system/monitoring/exception/_30072" = nlist(
	"name",      	"pacct.size",
	"descr",     	"/var/account/pacct not present",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
	"correlation",	"5010:1 < 0"
);


"/system/monitoring/exception/_30073" = nlist(
	"name",      	"tmp.quota",
	"descr",     	"no user quota on /tmp",
	"active",    	false,
	"latestonly",	false,
	"importance", 	2,
        "minoccurs",    2,
	"correlation",	"((9104:1 eq '/tmp') && (9104:7 != 1))"
);




"/system/monitoring/exception/_30318" = nlist(
	"name",      	"nomorestage",
	"descr",    	"nomorestage",
	"active",   	 true,
	"latestonly",	false,
	"importance", 	3,
    	"alarmtext", 	"nomorestage",
	"correlation",	"5005:1 != -1"
);





"/system/monitoring/exception/_30319" = nlist(
	"name",      	"nomorerfio",
	"descr",     	"nomorerfio",
	"active",   	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"nomorerfio",
	"correlation",	"5006:1 != -1"
);




"/system/monitoring/exception/_30320" = nlist(
	"name",      	"nomoremigt",
	"descr",     	"nomoremigt",
	"active",    	true,
	"latestonly",	false,
	"importance", 	2,
    	"alarmtext", 	"nomoremigr",
	"correlation",	"5008:1 != -1"
);


 

"/system/monitoring/exception/_30606" = nlist( 
	"name",       	"installation_failure", 
	"descr",      	"machine installation failure check ks-post-reboot.log", 
	"active",     	true, 
	"latestonly", 	false, 
	"importance", 	1, 
	"offset",     	"330",
	"correlation",	"5101:1 != -1",
); 


"/system/monitoring/exception/_30530" = nlist(
	"name",      	"eth0_speed_wrong",
	"descr",     	"Incorrect network interface speed for eth0",
	"active",    	true,
	"latestonly",	false,
	"period",	86400,
	"importance", 	2,
	"alarmtext",	"eth0_speed_wrong",
	"correlation", 	"(9200:1 eq 'eth0') && (9200:9 != -1) && ((9200:9 != symlink('/system/network/interfaces/eth0/switchmedium')) && (9200:9 < symlink('/hardware/cards/nic/0/maxspeed')))",
);


"/system/monitoring/exception/_30531" = nlist(
	"name",      	"eth1_speed_wrong",
	"descr",     	"Incorrect network interface speed for eth1",
	"active",    	false,
	"latestonly",	false,
	"period",	86400,
	"importance", 	2,
	"alarmtext",	"eth1_speed_wrong",
	"correlation", 	"(9200:1 eq 'eth1') && (9200:9 != -1) && ((9200:9 != symlink('/system/network/interfaces/eth1/switchmedium')) && (9200:9 < symlink('/hardware/cards/nic/1/maxspeed')))"
);


"/system/monitoring/exception/_30532" = nlist(
	"name",      	"eth2_speed_wrong",
	"descr",     	"Incorrect network interface speed for eth2",
	"active",    	false,
	"latestonly",	false,
	"period",	86400,
	"importance", 	2,
	"alarmtext",	"eth2_speed_wrong",
	"correlation", 	"(9200:1 eq 'eth2') && (9200:9 != -1) && ((9200:9 != symlink('/system/network/interfaces/eth2/switchmedium')) && (9200:9 < symlink('/hardware/cards/nic/2/maxspeed')))"
);


"/system/monitoring/exception/_30533" = nlist(
	"name",      	"eth3_speed_wrong",
	"descr",     	"Incorrect network interface speed for eth3",
	"active",    	false,
	"latestonly",	false,
	"period",	86400,
	"importance", 	2,
	"alarmtext",	"eth3_speed_wrong",
	"correlation", 	"(9200:1 eq 'eth3') && (9200:9 != -1) && ((9200:9 != symlink('/system/network/interfaces/eth3/switchmedium')) && (9200:9 < symlink('/hardware/cards/nic/3/maxspeed')))"
);


"/system/monitoring/exception/_30534" = nlist(
	"name",      	"eth4_speed_wrong",
	"descr",     	"Incorrect network interface speed for eth4",
	"active",    	false,
	"latestonly",	false,
	"period",	86400,
	"importance", 	2,
	"alarmtext",	"eth4_speed_wrong",
	"correlation", 	"(9200:1 eq 'eth4') && (9200:9 != -1) && ((9200:9 != symlink('/system/network/interfaces/eth4/switchmedium')) && (9200:9 < symlink('/hardware/cards/nic/4/maxspeed')))"
);

