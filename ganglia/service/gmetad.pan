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

unique template monitoring/ganglia/service/gmetad;

include { 'components/ganglia/config' };

'/software/components/ganglia/daemon/config_file' = '/etc/ganglia/gmetad.conf';
'/software/components/ganglia/daemon/gridname' = GANGLIA_GRIDNAME;
'/software/components/ganglia/daemon/data_source' = GANGLIA_DATA_SOURCES;

include { 'components/chkconfig/config' };

'/software/components/chkconfig/service/gmetad/on' = '';
'/software/components/chkconfig/service/gmetad/startstop' = true;

include { if (GANGLIA_FIREWALL) 'monitoring/ganglia/service/gmetad-firewall' };

