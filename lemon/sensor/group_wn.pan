#
# This file contains the demo definition for a *virtual* group sensor.
#
# Definition
#    - A group sensor, is a sensor which exposes no classes but inherits the 
#      classes from other sensors using the new PERL sensorAPI. It effectively
#      loads the other sensor modules into one group (one process!!!)
#
# Why?
#    - It reduces memory consumption!! For example:
#
#    - Old sytle
#      Name								VSize
#      /usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl ParseLog	10800
#      /usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl Sure		10620
#      /usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFScm		9968
#								Total	~31MB
# 
#    - New style
#      Name							Total	~11MB
#      /usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl AFScm Sure ParseLog
#
# Important
#    - Don't forget to include this template on the machine where the group
#      sensor will exist. 
#
# Notes
#    - To use the group sensor, either the node profile, cluster profile or even
#      sensor definition file (monitoring/lemon/sensor/*) must declare which group
#      it belongs too using the following syntax:
#
#      "/system/monitoring/sensor/parselog/group_name"   = "example";
#      "/system/monitoring/sensor/parselog/module_name" = "ParseLog";
#
#    - If the group is not present in the node profile, then ncm reconfiguration
#      will fail.

# Dependancies
#    - Requires: edg-fabricMonitoring-agent >= 2.12.1-2
#    - Requires: ncm-fmonagent              >= 1.0.25-1
#
template monitoring/lemon/sensor/group_wn;

# command line
#    - Note: $modules is mandatory, it will be replaced at ncm configuration time
#      with the correct sensor module name
#
"/system/monitoring/group/WN/cmdline" = "/usr/bin/perl /usr/libexec/sensors/lemon-sensor.pl $modules";
