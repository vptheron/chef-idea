idea Cookbook
=============
This cookbook will install the community edition of [IntelliJ IDEA](http://www.jetbrains.com/idea/).

The **default** recipe will:

* Download the IDE from JetBrains' website
* Extract the archive
* Configure the JVM options used to start the IDE

Requirements
------------

* Depends on **opscode/ark** cookbook

Attributes
----------

* `node['idea']['version']` - the version of IntelliJ IDEA to install (default: `14.1.3`).
* `node['idea']['64bits']['Xmx']` - specify the value of `-Xmx` in the 64bits configuration file (default: `2048m`).
* `node['idea']['64bits']['Xms']` - specify the value of `-Xms` in the 64bits configuration file (default: `2048m`).

Usage
-----
#### idea::default

Include `recipe[idea::default]` in your run_list and override the defaults you want changed.

Note: the recipe will not do anything if IntelliJ IDEA has already been installed and the cookbook has not changed.

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
