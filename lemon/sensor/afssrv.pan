#
# lemon-sensor-afssrv
#
template monitoring/lemon/sensor/afssrv;

"/system/monitoring/sensor/afssrv/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFSsrv";

"/system/monitoring/sensor/afssrv/class" = list(
	nlist("name", "afssrv.srvcalls",
		"descr", "Main Server Statistics",
		"field", list(
			nlist("name", "Server_Perf",                "format", "float",   "unit", "Calls/s"),
			nlist("name", "Server_Dir",                 "format", "float",   "unit", "Calls/s"),
			nlist("name", "Server_Del",                 "format", "float",   "unit", "Calls/s"),
			nlist("name", "Server_Read",                "format", "float",   "unit", "Packets/s"),
			nlist("name", "Server_Write",               "format", "float",   "unit", "Packets/s"),
			nlist("name", "Server_BuffActive",          "format", "float",   "unit", "Buffers"),
			nlist("name", "Server_IO_Opers" ,           "format", "float",   "unit", "Operations/s"),
			nlist("name", "Server_GiveUp_Callbacks",    "format", "float",   "unit", "Calls/s"),
			nlist("name", "Server_DeleteAll_Callbacks", "format", "float",   "unit", "Calls/s"),
			nlist("name", "Server_TotalRtt",            "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_MinRtt" ,             "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_MaxRtt" ,             "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_ServerConns",         "format", "float",   "unit", "Conns/s"),
			nlist("name", "Server_ClientConns" ,        "format", "float",   "unit", "Conns/s"),
			nlist("name", "Server_FetchOps",            "format", "float",   "unit", "Operations/s"),
			nlist("name", "Server_StoreOps",            "format", "float",   "unit", "Operations/s"),
			nlist("name", "Server_RemoveFileOps",       "format", "float",   "unit", "Operations/s"),
			nlist("name", "Server_CreateFileOps",       "format", "float",   "unit", "Operations/s"),
			nlist("name", "Server_FetchData_MinRtt",    "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_FetchData_MaxRtt",    "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_StoreData_MinRtt",    "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_StoreData_MaxRtt",    "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_RemoveFile_MinRtt",   "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_RemoveFile_MaxRtt",   "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_CreateFile_MinRtt",   "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_CreateFile_MaxRtt",   "format", "float",   "unit", "seconds", "scale", 0.000001),
			nlist("name", "Server_ThrIdle",             "format", "float",   "unit", "Threads"),
			nlist("name", "Server_ThrWait",             "format", "float",   "unit", "Threads"),
			nlist("name", "Server_Avgrq",               "format", "float",   "unit", "Requests"),
			nlist("name", "Server_Avgqu",               "format", "float",   "unit", "Queue Length"),
			nlist("name", "Server_Await",               "format", "float",   "unit", "seconds", "scale", 0.001),
			nlist("name", "Server_ServiceTime",         "format", "float",   "unit", "seconds", "scale", 0.001),
		),
	),	
);
