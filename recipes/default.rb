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

include_recipe "java"

user = node['idea']['user']
group = node['idea']['group']
setup_dir = node['idea']['setup_dir']

version = node['idea']['version']
ide_dir = node['idea']['ide_dir'] || 'idea-IC-' + version

full_path = File.join(setup_dir, ide_dir)
archive_path = File.join(setup_dir, "idea.tar.gz")

if !::File.exists?("#{full_path}")

  # Download IDEA archive
  remote_file archive_path do 
    source "http://download.jetbrains.com/idea/ideaIC-#{version}.tar.gz"
    backup false
    user user
    group group
  end

  # Extract archive
  execute 'extract archive' do
    command "tar xf #{archive_path} -C #{setup_dir}/; mv #{setup_dir}/idea-IC-* #{full_path}"
    user user
    group group
    action :run
  end 

  # vmoptions config
  template "#{full_path}/bin/idea64.vmoptions" do
    source "idea64.vmoptions.erb"
    variables(
      :xms => node['idea']['64bits']['Xms'],
      :xmx => node['idea']['64bits']['Xmx']
    )
    owner user
    group group
    mode 0664
    action :create
  end

  # Delete archive
  file "#{archive_path}" do
    action :delete
  end

end
