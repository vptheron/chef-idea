#
# Cookbook Name:: idea
# Attributes:: default
#
# Author:: Vincent Theron <vptheron@gmail.com>
#
# Copyright 2014, Vincent Theron
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['idea']['64bits']['Xmx'] = '2048m'
default['idea']['64bits']['Xms'] = '2048m'

case node['platform_family']
when 'windows'
  default['idea']['url'] = "https://download-cf.jetbrains.com/idea/ideaIU-2016.3.5.exe"
  default['idea']['sha256'] = "3D657662526E427E1FC472DB06C1ED223BCF8C3434C0BA90DFA4554465B2D376"
  default['idea']['packagename'] = "Idea IntelliJ 2016.3.5"  
  default['java']['windows']['package_name'] = 'Java(TM) SE Development Kit 8 (64-bit)'
else
  default['idea']['edition'] = 'C'
  default['idea']['version'] = '2016.2.5'
  edition = node['idea']['edition']
  version = node['idea']['version']
  default['idea']['url'] = "https://download-cf.jetbrains.com/idea/ideaI#{edition}-#{version}.tar.gz"
end 
