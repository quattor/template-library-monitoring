#
# monitoring/lemon/sensor/afscm
#
# This file contains the sensor definition for the afscm sensor

# Dependencies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.2-1
#
template monitoring/lemon/sensor/afscm;

# definition
"/system/monitoring/sensor/afscm/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFScm";

# additional protocols the sensor supports
"/system/monitoring/sensor/afscm/supports" = "CFG SOD CHK VER";

# module names
"/system/monitoring/sensor/afscm/module_names" = "AFScm";

# classes
"/system/monitoring/sensor/afscm/class" = list(
	nlist("name", "afscm.cmufs",
		"descr", "Cache UFS Main Parameters (Read/Write and Fetch/Store) per second",
		"field", list(
			nlist("name", "Cache_UFS_Read",      "format", "%3.f", "unit", "Ops/s"),
		  	nlist("name", "Cache_UFS_Write",     "format", "%3.f", "unit", "Ops/s"),
			nlist("name", "Cache_UFSFetch_Proc", "format", "%3.f", "unit", "Procs/s"),
                        nlist("name", "Cache_UFSStore_Proc", "format", "%3.f", "unit", "Procs/s"),)
	),
           
	nlist("name", "afscm.cmstats",
		"descr", "Cache Main Statistics",
		"field", list(
			nlist("name", "Cache_FetchStatus_Ops",    "format", "%3.f",   "unit", "Ops/s"),
			nlist("name", "Cache_StoreStatus_Ops" ,   "format", "%3.f",   "unit", "Ops/s"),
			nlist("name", "Cache_RemoteAccessesPerc", "format", "%1.f",    "unit", "Accesses"),
			nlist("name", "Cache_RemoteAccesses" ,  "format", "%3.f",   "unit", "Accesses/s"),
			nlist("name", "Cache_LocalAccesses" ,   "format", "%3.f",   "unit", "Accesses/s"),
			nlist("name", "Cache_BufferAlloced",      "format", "%3.f",   "unit", "Buffers"),
			nlist("name", "Cache_BufferHits" ,        "format", "%3.f",   "unit", "Hits/s"),
			nlist("name", "Cache_BufferMisses" ,      "format", "%3.f",   "unit", "Misses/s"),
			nlist("name", "Cache_PAGs",               "format", "%3.f",   "unit", "PAGs/s"),
			nlist("name", "Cache_Auth" ,              "format", "%3.f",   "unit", "Auths/s"),
			nlist("name", "Cache_Tickets" ,           "format", "%3.f",   "unit", "Tickets/s"),	
			nlist("name", "Cache_FetchOps",           "format", "%3.f",   "unit", "Ops/s"),
			nlist("name", "Cache_StoreOps" ,          "format", "%3.f",   "unit", "Ops/s"),
			nlist("name", "Cache_NumEntries",         "format", "%3.f", "unit", "Entries"),
			nlist("name", "Cache_BlocksinUse" ,       "format", "%3.f",   "unit", "Blocks in Use"),
			nlist("name", "Cache_Hits",               "format", "%1.f",    "unit", "Hits %"),
			nlist("name", "Cache_Misses",             "format", "%1.f",    "unit", "Misses %"),
			nlist("name", "V_Cache_Hits",             "format", "%1.f",    "unit", "Hits %"),
			nlist("name", "V_Cache_Misses",           "format", "%1.f",    "unit", "Misses %"),
			nlist("name", "Cache_Size",               "format", "%1.f",    "unit", "MB"),
			nlist("name", "Cache_FReused" ,           "format", "%1.f",    "unit", "Files"),)
	),
);


