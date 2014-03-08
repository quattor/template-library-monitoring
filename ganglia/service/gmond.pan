# #
# quattor-cloud-config, 1.4, 20110303.1802.09
#
#
# Created as part of the StratusLab project (http://stratuslab.eu)
#
# Copyright (c) 2010-2011, Centre National de la Recherche Scientifique
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unique template monitoring/ganglia/service/gmond;

include { 'components/chkconfig/config' };

'/software/components/chkconfig/service/gmond/on' = '';
'/software/components/chkconfig/service/gmond/startstop' = true;

include { 'components/ganglia/config' };

'/software/components/ganglia/client/config_file' = '/etc/ganglia/gmond.conf';
'/software/components/ganglia/client/cluster/name' = GANGLIA_CLUSTER_NAME;
'/software/components/ganglia/client/globals/send_metadata_interval' = 15;
'/software/components/ganglia/client/udp_send_channel/host' = GANGLIA_MASTER;
'/software/components/ganglia/client/globals/allow_extra_data' = true;

include { if (GANGLIA_FIREWALL) 'monitoring/ganglia/service/gmond-firewall' };

prefix '/software/components/ganglia/client';

'modules/0/name' = 'core_metrics';
'modules/1/name' = 'cpu_module';
'modules/1/path' = 'modcpu.so';
'modules/2/name' = 'disk_module';
'modules/2/path' = 'moddisk.so';
'modules/3/name' = 'load_module';
'modules/3/path' = 'modload.so';
'modules/4/name' = 'mem_module';
'modules/4/path' = 'modmem.so';
'modules/5/name' = 'net_module';
'modules/5/path' = 'modnet.so';
'modules/6/name' = 'proc_module';
'modules/6/path' = 'modproc.so';
'modules/7/name' = 'sys_module';
'modules/7/path' = 'modsys.so';

prefix '/software/components/ganglia/client';

'includes/0' = '/etc/ganglia/conf.d/*.conf';

prefix '/software/components/ganglia/client/collection_groups/0/';
'collect_once'   = true;
'time_threshold' = 20;

'metric/0/name'  = 'heartbeat';

prefix '/software/components/ganglia/client/collection_groups/1/';

'collect_once'   = true;
'time_threshold' = 1200;

'metric/0/name'  = 'cpu_num';
'metric/0/title' = 'CPU Count';
'metric/1/name'  = 'cpu_speed';
'metric/1/title' = 'CPU Speed';
'metric/2/name'  = 'mem_total';
'metric/2/title' = 'Memory Total';
'metric/3/name'  = 'swap_total';
'metric/3/title' = 'Swap Space Total';
'metric/4/name'  = 'boottime';
'metric/4/title' = 'Last Boot Time';
'metric/5/name'  = 'machine_type';
'metric/5/title' = 'Machine Type';
'metric/6/name'  = 'os_name';
'metric/6/title' = 'Operating System';
'metric/7/name'  = 'os_release';
'metric/7/title' = 'Operating System Release';
'metric/8/name'  = 'location';
'metric/8/title' = 'Location';

prefix '/software/components/ganglia/client/collection_groups/2/';

'collect_once'   = true;
'time_threshold' = 300;

'metric/0/name'  = 'gexec';
'metric/0/title' = 'Gexec Status';

prefix '/software/components/ganglia/client/collection_groups/3/';

'collect_every'  = 20;
'time_threshold' = 90;

'metric/0/name'            = 'cpu_user';
'metric/0/value_threshold' = '1.0';
'metric/0/title'           = 'CPU User';
'metric/1/name'            = 'cpu_system';
'metric/1/value_threshold' = '1.0';
'metric/1/title'           = 'CPU System';
'metric/2/name'            = 'cpu_idle';
'metric/2/value_threshold' = '5.0';
'metric/2/title'           = 'CPU Idle';
'metric/3/name'            = 'cpu_nice';
'metric/3/value_threshold' = '1.0';
'metric/3/title'           = 'CPU Nice';
'metric/4/name'            = 'cpu_aidle';
'metric/4/value_threshold' = '5.0';
'metric/4/title'           = 'CPU aidle';
'metric/5/name'            = 'cpu_wio';
'metric/5/value_threshold' = '1.0';
'metric/5/title'           = 'CPU wio';
'metric/6/name'            = 'cpu_intr';
'metric/6/value_threshold' = '1.0';
'metric/6/title'           = 'CPU intr';
'metric/7/name'            = 'cpu_sintr';
'metric/7/value_threshold' = '1.0';
'metric/7/title'           = 'CPU sintr';

prefix '/software/components/ganglia/client/collection_groups/4/';

'collect_every'  = 20;
'time_threshold' = 90;

'metric/0/name'            = 'load_one';
'metric/0/value_threshold' = '1.0';
'metric/0/title'           = 'One Minute Load Average';
'metric/1/name'            = 'load_five';
'metric/1/value_threshold' = '1.0';
'metric/1/title'           = 'Five Minute Load Average';
'metric/2/name'            = 'load_fifteen';
'metric/2/value_threshold' = '1.0';
'metric/2/title'           = 'Fifteen Minute Load Average';

prefix '/software/components/ganglia/client/collection_groups/5/';

'collect_every'  = 80;
'time_threshold' = 950;

'metric/0/name'            = 'proc_run';
'metric/0/value_threshold' = '1.0';
'metric/0/title'           = 'Total Running Processes';
'metric/1/name'            = 'proc_total';
'metric/1/value_threshold' = '1.0';
'metric/1/title'           = 'Total Processes';

prefix '/software/components/ganglia/client/collection_groups/6/';

'collect_every'  = 40;
'time_threshold' = 180;

'metric/0/name'            = 'mem_free';
'metric/0/value_threshold' = '1024.0';
'metric/0/title'           = 'Free Memory';
'metric/1/name'            = 'mem_shared';
'metric/1/value_threshold' = '1024.0';
'metric/1/title'           = 'Shared Memory';
'metric/2/name'            = 'mem_buffers';
'metric/2/value_threshold' = '1024.0';
'metric/2/title'           = 'Memory Buffers';
'metric/3/name'            = 'mem_cached';
'metric/3/value_threshold' = '1024.0';
'metric/3/title'           = 'Cached Memory';
'metric/4/name'            = 'swap_free';
'metric/4/value_threshold' = '1024.0';
'metric/4/title'           = 'Free Swap Space';

prefix '/software/components/ganglia/client/collection_groups/7/';

'collect_every'  = 40;
'time_threshold' = 300;

'metric/0/name'            = 'bytes_out';
'metric/0/value_threshold' = '4096';
'metric/0/title'           = 'Bytes Sent';
'metric/1/name'            = 'bytes_in';
'metric/1/value_threshold' = '4096';
'metric/1/title'           = 'Bytes Received';
'metric/2/name'            = 'pkts_in';
'metric/2/value_threshold' = '256';
'metric/2/title'           = 'Packets Received';
'metric/3/name'            = 'pkts_out';
'metric/3/value_threshold' = '256';
'metric/3/title'           = 'Packets Sent';

prefix '/software/components/ganglia/client/collection_groups/8/';

'collect_every'  = 1800;
'time_threshold' = 3600;

'metric/0/name'            = 'disk_total';
'metric/0/value_threshold' = '1.0';
'metric/0/title'           = 'Total Disk Space';

prefix '/software/components/ganglia/client/collection_groups/9/';

'collect_every'  = 40;
'time_threshold' = 180;

'metric/0/name'            = 'disk_free';
'metric/0/value_threshold' = '1.0';
'metric/0/title'           = 'Disk Space Available';
'metric/1/name'            = 'part_max_used';
'metric/1/value_threshold' = '1.0';
'metric/1/title'           = 'Maximum Disk Space Used';
