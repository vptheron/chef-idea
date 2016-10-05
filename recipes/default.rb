#
# Cookbook Name:: idea
# Recipe:: default
#
# Copyright 2014-2016, Vincent Theron
# Copyright 2016, Cask Data, Inc.
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

include_recipe 'java'
include_recipe 'ark'

idea_url = node['idea']['url']
idea_version = node['idea']['version']
setup_dir = node['idea']['setup_dir'] || '/opt'

# Download, unpack, and install
ark 'idea' do
  url idea_url
  version idea_version
  extension 'tar.gz'
  has_binaries ['idea.sh']
  append_env_path true
  prefix_root setup_dir
  prefix_home setup_dir
  owner node['idea']['user'] unless node['idea']['user'].nil?
  group node['idea']['group'] unless node['idea']['group'].nil?
  action :install
end

# vmoptions config
template File.join(setup_dir, "idea-#{idea_version}/bin", 'idea64.vmoptions') do
  source 'idea64.vmoptions.erb'
  variables(
    xms: node['idea']['64bits']['Xms'],
    xmx: node['idea']['64bits']['Xmx']
  )
  owner node['idea']['user'] unless node['idea']['user'].nil?
  group node['idea']['group'] unless node['idea']['group'].nil?
  mode '0644'
  action :create
end

full_edition =
  if node['idea']['edition'] == 'U'
    'Ultimate'
  else
    'Community'
  end

# .desktop entry
template '/usr/share/applications/idea.desktop' do
  source 'idea.desktop.erb'
  variables(
    setup_dir: setup_dir,
    full_edition: full_edition
  )
  action :create
end
