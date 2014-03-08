#
# monitoring/lemon/sensor/oracle
#
# This file contains the sensor definition for the oracle sensor

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.13.1-1
#    - Requires: lemon-sensor-oracle        >= 1.0-11
#
template monitoring/lemon/sensor/oracle;

# command line
"/system/monitoring/sensor/oracle/cmdline"="/usr/bin/perl -I /usr/libexec/sensors -Moracle /usr/libexec/sensors/edg-fmon-sensor.pl -PUT=03";

# class definitions
"/system/monitoring/sensor/oracle/class"=list(
	nlist("name", "oracle::SID_stats",
	      	"descr", "Oracle DB performance views",
              	"field", list(
			nlist("name", "sqlnet_round_trip",             "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "sqlnet_received",               "format", "float", "unit", "Bytes/s", "scale",1.0),
			nlist("name", "sqlnet_sent",                   "format", "float", "unit", "Bytes/s", "scale",1.0),
			nlist("name", "consistent_gets",               "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "db_blocks_gets",                "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "execute_count",                 "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "index_ffs_direct_read",         "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "index_ffs_full",                "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "index_ffs_rowid_changes",       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "index_fetch_by_key",            "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "index_scan_kdiixs1",	       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "leaf_node_splits",	       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "logons",                        "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "logons_current", 	       "format", "float", "unit", "count",   "scale",1.0),
			nlist("name", "opened_cursors", 	       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "opened_cursors_current",        "format", "float", "unit", "count",   "scale",1.0),
			nlist("name", "hard_parse", 	               "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "total_parse", 	               "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "physical_reads", 	       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "physical_reads_cache", 	       "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "physical_reads_cache_prefetch", "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "physical_writes",               "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "physical_writes_direct",        "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "recursive_calls",               "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "redo_size",                     "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "session_logical_reads",         "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "sorts_disk",                    "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "sorts_memory",                  "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "sorts_rows",                    "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "user_calls",                    "format", "float", "unit", "count/s", "scale",1.0),
			nlist("name", "user_commits",                  "format", "float", "unit", "count/s", "scale",1.0)
		)
	),

	nlist("name", "oracle::User_stats",
	      	"descr", "Oracle User performance stats",
              	"field", list(
			nlist("name", "username",           "format", "%32s", "descr", "Application name", "primary", true),
			nlist("name", "nsessions",          "format", "integer", "unit", "count", "scale", 1.0, "descr", "Number of sessions currently open"),
			nlist("name", "new_sessions",       "format", "float",   "unit", "count", "scale", 1.0, "descr", "Number of sessions opened in this time slot"),
			nlist("name", "tot_lreads",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total buffer gets"),
			nlist("name", "tot_preads", 	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total physical reads"),
			nlist("name", "tot_pwrites",        "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total physical writes"),
			nlist("name", "avg_ncalls",         "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of calls per session"),
			nlist("name", "avg_roundtrips",     "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of SQL*Net roundtrips per session"),
			nlist("name", "avg_bytes_sent",     "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average bytes sent via SQL*Net to client per session"),
			nlist("name", "avg_bytes_received", "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average bytes received via SQL*Net from client per session"),
			nlist("name", "avg_parse_count",    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of hard parsing per session"),
			nlist("name", "avg_parse_cpu",      "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average CPU spent on parsing per session"),
			nlist("name", "avg_open_cursors",   "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage number of open cursor per session"),
			nlist("name", "avg_ncommits",       "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage number of commits per session"),
			nlist("name", "avg_db_time",        "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage db_time spent per session"),
			nlist("name", "avg_clus_wait_time", "format", "float",   "unit", "count", "scale", 1.0, "descr", "Averaged time spent waiting for various resources in the cluster"),
			nlist("name", "tot_pga_memory",     "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total PGA memory used by the application")
		)
	),

	nlist("name", "oracle::User_session_stats",
	     	"descr", "Oracle User session stats",
              	"field", list(
			nlist("name", "username",     "format", "%32s",  "descr", "Application name", "primary", true),
			nlist("name", "tot_cpu_rel",  "format", "float", "unit", "count", "scale", 1.0, "descr", "Relative CPU consumption"),
			nlist("name", "tot_cpu",      "format", "float", "unit", "count", "scale", 1.0, "descr", "Absolute CPU time consumption"),
			nlist("name", "avg_cpu",      "format", "float", "unit", "count", "scale", 1.0, "descr", "Average session CPU time consumption"),
			nlist("name", "avg_duration", "format", "float", "unit", "count", "scale", 1.0, "descr", "Averaged duration of session")
		)
	),

	nlist("name", "oracle::User_cluster_stats",
	      	"descr", "Oracle Cluster User performance stats",
              	"field", list(
			nlist("name", "username",           "format", "%32s",    "descr", "Application name", "primary", true),
			nlist("name", "nsessions",	    "format", "integer", "unit", "count", "scale", 1.0, "descr", "Number of sessions currently open"),
			nlist("name", "new_sessions",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Number of sessions opened in this time slot"),
			nlist("name", "tot_lreads",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total buffer gets"),
			nlist("name", "tot_preads",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total physical reads"),
			nlist("name", "tot_pwrites",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total physical writes"),
			nlist("name", "avg_ncalls",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of calls per session"),
			nlist("name", "avg_roundtrips",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of SQL*Net roundtrips per session"),
			nlist("name", "avg_bytes_sent",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average bytes sent via SQL*Net to client per session"),
			nlist("name", "avg_bytes_received", "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average bytes received via SQL*Net from client per session"),
			nlist("name", "avg_parse_count",    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average number of hard parsing per session"),
			nlist("name", "avg_parse_cpu",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Average CPU spent on parsing per session"),
			nlist("name", "avg_open_cursors",   "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage number of open cursor per session"),
			nlist("name", "avg_ncommits",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage number of commits per session"),
			nlist("name", "avg_db_time",	    "format", "float",   "unit", "count", "scale", 1.0, "descr", "Avererage db_time spent per session"),
			nlist("name", "avg_clus_wait_time", "format", "float",   "unit", "count", "scale", 1.0, "descr", "Averaged time spent waiting for various resources in the cluster"),
			nlist("name", "tot_pga_memory",     "format", "float",   "unit", "count", "scale", 1.0, "descr", "Total PGA memory used by the application")
		)
	),

	nlist("name", "oracle::User_cluster_session",
	      	"descr", "Oracle User cluster session staistics",
              	"field", list(
			nlist("name", "username",         "format", "%32s", "descr", "Application name", "primary", true),
			nlist("name", "tot_cpu_rel",      "format", "float", "unit", "count", "scale", 1.0, "descr", "Relative CPU consumption"),
			nlist("name", "tot_cpu",          "format", "float", "unit", "count", "scale", 1.0, "descr", "Absolute CPU time consumption"),
			nlist("name", "avg_cpu",          "format", "float", "unit", "count", "scale", 1.0, "descr", "Average session CPU time consumption"),
			nlist("name", "avg_duration",     "format", "float", "unit", "count", "scale", 1.0, "descr", "Averaged duration of session")
		)
	),

	nlist("name", "oracle::Instance_tablespaces",
	      	"descr", "Oracle Instance tablespace stats",
              	"field", list(
			nlist("name", "Tablespace_name", "format", "%32s",  "descr", "Tablespace name", "primary", true),
			nlist("name", "Allocated",       "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Allocated tablespace space"),
			nlist("name", "Free",		 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Free tablespace space"),
			nlist("name", "Used",		 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Used tablespace space"),
			nlist("name", "Pct_used",	 "format", "float", "unit", "%",     "scale", 1.0, "descr", "Tablespace used %"),
			nlist("name", "Max_block",	 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Maximum sized block")
		)
	),

	nlist("name", "oracle::Cluster_tablespaces",
	      "descr", "Oracle Cluster tablespace stats",
              "field", list(
			nlist("name", "Tablespace_name", "format", "%32s",  "descr", "Tablespace name", "primary", true),
			nlist("name", "Allocated",       "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Allocated tablespace space"),
			nlist("name", "Free",      	 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Free tablespace space"),
			nlist("name", "Used",      	 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Used tablespace space"),
			nlist("name", "Pct_used",  	 "format", "float", "unit", "%",     "scale", 1.0, "descr", "Tablespace used %"),
			nlist("name", "Max_block", 	 "format", "%ld",   "unit", "Bytes", "scale", 1.0, "descr", "Maximum sized block")
		)
	),

	nlist("name", "oracle::Instance_wait",
	      	"descr", "Oracle instace wait stats",
              	"field", list(
			nlist("name", "Username",   "format", "%32s", "descr", "Application name", "primary", true),
			nlist("name", "Event_name", "format", "%50s", "descr", "Event name",       "primary", true),
			nlist("name", "RELDBTIME",  "format", "float", "unit", "%", "scale", 1.0, "descr", "Percent of DB time spent on the specific event"),
			nlist("name", "RELTotTIME", "format", "float", "unit", "%", "scale", 1.0, "descr", "Percent of total wait time spent on the specific event")
		)
	),

	nlist("name", "oracle::Cluster_wait",
	      	"descr", "Oracle cluster wait stats",
              	"field", list(
			nlist("name", "Username",   "format", "%32s", "descr", "Application name", "primary", true),
			nlist("name", "Event_name", "format", "%50s", "descr", "Event name", "primary", true),
		 	nlist("name", "RELDBTIME",  "format", "float", "unit", "%", "scale", 1.0, "descr", "Percent of DB time spent on the specific event"),
			nlist("name", "RELTotTIME", "format", "float", "unit", "%", "scale", 1.0, "descr", "Percent of total wait time spent on the specific event")
		)
	),

	nlist("name", "oracle::InstanceInfo",
	      	"descr", "Oracle Instance Information",
              	"field", list(
			nlist("name", "DB_name",      "format", "%32s",    "descr", "Database name"),
			nlist("name", "Log_mode",     "format", "%32s",    "descr", "Database log mode"),
			nlist("name", "DB_version",   "format", "%32s",    "descr", "Database verion"),
			nlist("name", "Startup_time", "format", "%22s",    "descr", "Database startup time"),
			nlist("name", "DB_status",    "format", "%22s",    "descr", "Database status"),
			nlist("name", "CPU_count",    "format", "integer", "unit", "count", "scale", 1.0, "descr", "Number of CPUs on instance")
		)
	),

	nlist("name", "oracle::Heartbeat",
	      	"descr", "Oracle Instance Status",
              	"field", list(
			nlist("name", "Status", "format", "integer", "descr", "Sensor status")
		)
	)
);


# End-of-File
