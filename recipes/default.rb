#
# Cookbook Name:: idea
# Recipe:: default
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

include_recipe "ark"

version = node['idea']['version']

# Determine the path to the installer, based on the version of IDEA that is being requested.
if node['idea']['url'].to_s.strip.length == 0
  idea_url = "http://download.jetbrains.com/idea/ideaIC-#{version}.tar.gz"
else
  idea_url = node['idea']['url']
end

# Download the installer, unpack, and run.
ark "idea" do
  url idea_url
  version version
  extension "tar.gz"
  has_binaries ['idea']
  append_env_path true
  action :install
end

# Override the values in the vmoptions file.
template "/usr/local/idea/bin/idea64.vmoptions" do
  source "idea64.vmoptions.erb"
  variables(
    :xms => node['idea']['64bits']['Xms'],
    :xmx => node['idea']['64bits']['Xmx']
  )
  action :create
end

# Creates an entry in the "Applications" listing, under "Programming".
template "/usr/share/applications/idea.desktop" do
  source "idea.desktop.erb"
  action :create
end