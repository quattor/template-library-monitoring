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

unique template monitoring/ganglia/service/variables;

variable GANGLIA_VERSION_NUM ?= '3.1.7-1';

variable GANGLIA_GRIDNAME ?= 'QWG ganglia';
variable GANGLIA_DATA_SOURCES ?= nlist('DEFAULT','localhost');

variable GANGLIA_MASTER ?= undef;
variable GANGLIA_CLUSTER_NAME ?= undef;
variable GANGLIA_WEB_SERVER ?= GANGLIA_MASTER;

variable GANGLIA_METADATA_INTERVAL ?= '15';

variable GANGLIA_FIREWALL ?= false;
variable GANGLIA_GMETAD_XPORT ?= '8651';
variable GANGLIA_GMETAD_IPORT ?= '8652';
variable GANGLIA_GMOND_PORT ?= '8649';
