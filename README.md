idea Cookbook
=============
This cookbook will install the community edition of [IntelliJ IDEA](http://www.jetbrains.com/idea/).

The **default** recipe of this chef cookbook will:

* Create the target directory to install the IDE
* Download and extract the archive
* Configure the JVM options used to start the IDE

Requirements
------------

* Depends on **opscode/java** cookbook

Attributes
----------

* `node['idea']['setup_dir']` - Target directory for installation (e.g. `/home/john/tools). This cookbook *will* create `setup_dir` if it does not exist, however only the last directory on the path (in the previous example `tools`) will be owned by `user` (see below).
* `node['idea']['user']` - user and group owner of `setup_dir` and `target_dir`.
* `node['idea']['version']` - the version of IntelliJ IDEA to install (default: `13.0.2`).
* `node['idea']['target_dir']` - the IDE directory (default: `idea-IC-13`).
* `node['idea']['64bits']['Xmx']` - specify the value of `-Xmx` in the 64bits configuration file (default: `2048m`).
* `node['idea']['64bits']['Xms']` - specify the value of `-Xms` in the 64bits configuration file (default: `2048m`).

The cookbook also provides default values to configure the `java::default` recipe:

* `node['java']['install_flavor']` defaults to `openjdk`
* `node['java']['jdk_version']` defaults to `7`

Usage
-----
#### idea::default

Include `recipe[idea::default]` in your run_list and override the defaults you want changed.

Note: the recipe will not do anything if `node['idea']['setup_dir']/node['idea']['target_dir']` already exists.

Contributing
------------

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome!

License and Authors
-------------------
Author:: [Vincent Theron][vptheron] (<vptheron@gmail.com>)

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
