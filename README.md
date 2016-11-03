idea Cookbook
=============

[![Build Status](https://travis-ci.org/vptheron/chef-idea.svg?branch=master)](https://travis-ci.org/vptheron/chef-idea)

This cookbook will install the community or ultimate edition of [IntelliJ IDEA](http://www.jetbrains.com/idea/).

The **default** recipe will:

* Download the Community or Ultimate Edition of the IDE from JetBrains' website
* Extract the archive
* Configure the JVM options used to start the IDE
* Create a Freedesktop Desktop Specification entry

Requirements
------------

* Depends on **opscode/java** and **opscode/ark** cookbooks

Attributes
----------
 
* `node['idea']['setup_dir']` - Target directory for installation. This cookbook does *not* create `setup_dir` if it does not exist.
* `node['idea']['user']` - user owner of the installation.
* `node['idea']['group']` - group owner of the installation (default to the same value as `user` if not specified).
* `node['idea']['edition']` - Target edition of IntelliJ IDEA to install. Defaults to `C` for Community edition. Other acceptable value: `U` for Ultimate.
* `node['idea']['version']` - the version of IntelliJ IDEA to install (default: `2016.2.5`).
* `node['idea']['url']` - Download URL for IntelliJ IDEA (default: `https://download-cf.jetbrains.com/idea/ideaI#{edition}-#{version}.tar.gz`).
* `node['idea']['64bits']['Xmx']` - specify the value of `-Xmx` in the 64bits configuration file (default: `2048m`).
* `node['idea']['64bits']['Xms']` - specify the value of `-Xms` in the 64bits configuration file (default: `2048m`).

Usage
-----
#### idea::default

Include `recipe[idea::default]` in your run_list and override the defaults you want changed.

Note: the recipe will not do anything if `node['idea']['setup_dir']` already contains the chosen version of IntelliJ IDEA.

Contributing
------------

* Source hosted at [GitHub](https://github.com/vptheron/chef-idea)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/vptheron/chef-idea/issues)

Pull requests are very welcome!

License and Authors
-------------------
Author:: [Vincent Theron](https://github.com/vptheron) ([vptheron](mailto:vptheron@gmail.com))

Contributors:: https://github.com/vptheron/chef-idea/contributors

Copyright:: 2014, Vincent Theron

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
