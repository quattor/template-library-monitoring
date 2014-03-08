# 
# monitoring basic types 
# 

declaration template monitoring/lemon/schema; 

#include monitoring/lemon/functions; 


type structure_metric_smooth = { 
"onvalue" ? string # "apply to values eq to string" 
"cacheall" ? boolean # "cache all values locally" 
"index" ? long # "word to use for smoothing cmp" 
"typeString" : boolean # "type is string or number" 
"maxdiff" ? double 
"maxtime" ? long 
"primarykeys" ? long # "the number of primary keys in the sample" 
}; 

type structure_metric = { 
"name" : string # "name of the metric" 
"active" : boolean # "is the metric active or not" 
"latestonly": boolean # "keep historical values of metric?" 
"class" : string # "metric class" 
"descr" ? string # "description of metric" 
"period" : long # "sampling frequency" 
"offset" ? string # "sampling offset" 
"reftime" ? string # "sampling reference time" 
"smooth" ? structure_metric_smooth # "smoothing" 
"param" ? string[] # "metric specific parameters" # more typing! 
"local" ? boolean # "localised metric" 
"latest_clean" ? boolean # "clean latest value for entity on update" 
"latest_expires" ? long # "latest data expires after what time (in seconds)" 
"schema_version" ? long # "version of schema for the metric (entity vs nodename)" 
"priority" ? long # "prioriry of data insertion" 
}; 

type structure_actuator = { 
"execve" : string # "program to run" 
"maxruns" : long # "maximum number of execs" 
"timeout" : long # "timeout of operation" 
"active" : boolean # "is actuator active?" 
"window" ? long # "time window in sec for running the action" 
}; 

type structure_exception = { 
"name" : string # "name of the metric" 
"active" : boolean # "is the metric active or not" 
"latestonly" : boolean # "keep historical values of metric?" 
"descr" ? string # "description of metric" 
"importance" : long(0..3) # "importance of the alarm" 
"period" ? long # "sampling frequency/or same as reference metric" 
"offset" ? string # "exception sampling offset" 
"correlation" ? string # "correlation string with metrics" 
"actuator" ? structure_actuator # "actuator information" 
"reftime" ? string # "sampling reference time" 
"smooth" ? structure_metric_smooth # "smoothing" 
"alarmtext" ? string # "alarm text for operators (SURE)" 
"local" ? boolean # "localised alarm" 
"silent" ? boolean # "the alarm is silent from lemon-host-check" 
"minoccurs" ? long # "the minimum number of occurrences of a problem before creating an alarm" 
"latest_clean" ? boolean # "clean latest value for entity upon update" 
"latest_expires" ? long # "latest data expires afte what time (in seconds)" 
"schema_version" ? long # "version of schema for the metric" 
"priority" ? long # "prioriry of data insertion" 
}; 

type structure_mondfieldtype = { 
"name" : string # "metric name" 
"format" : string # "format" 
"primary" ? boolean # "primary key?" 
"descr" ? string # "data field description" 
"unit" ? string # "units of measurement" 
"scale" ? double # "scale of measurement (1024,1000 of basic units)" 
"default" ? string # "default value of the field" 
}; 

type structure_metricclass = { 
"name" : string # "metric class name" 
"field" ? structure_mondfieldtype[] # "data fields" 
"descr" ? string # "metric class description" 
}; 

type structure_fmonsensor = { 
"cmdline" : string # "command line arguments" 
"env" ? string{} # "environment variables to set" 
"class" : structure_metricclass[] 
"supports" ? string # "supported extra API protocols" 
"group_name" ? string # "defines the group the sensor module should run under" 
"module_names" ? string # "name of the module to load into the group" 
"user" ? string # "run sensor as user" 
}; 

type structure_fmongroup = { 
"cmdline" : string # "command line arguments" 
"supports" ? string # "supported extra API protocols" 
"env" ? string{} # "environment variables to set" 
}; 

type structure_monitoring_general = { 
"logfile" : string 
"cachedir" : string 
"configfile" ? string 
"maxsamplelength" ? long 
"shorthostname" ? boolean 
"resetmmaps" ? boolean 
"sodpipe" ? string # "sampling on demand pipe" 
"privatekeyfile" ? string 
"digesttype" ? string 
"statepath" ? string 
"identifier" ? string # "the agents identifier if not the hostname" 
"user" ? string # "run agent as user" 
"sensoruser" ? string # "default user for all sensors" 
}; 


type structure_monitoring_transport_server = { 
"server" : type_hostname 
"port" : long 
"nowarnings" ? boolean 
"proto" : string with match (SELF, '(TCP|UDP)') 
"useauth" ? boolean 
"MaxCacheBytes" ? long # "Cache size in bytes" 
"MaxCacheItems" ? long # "Cache size in metric samples" 
}; 

type structure_monitoring = { 
"general" : structure_monitoring_general 
"transport" : structure_monitoring_transport_server{} 
"metric" : structure_metric{} # "metrics" 
"exception" ? structure_exception{} # "exceptions" 
"sensor" : structure_fmonsensor{} # "sensors and metric classes" 
"group" ? structure_fmongroup{} # "sensor and metric class grouping" 
}; 
