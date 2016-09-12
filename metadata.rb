name             'idea'
maintainer       'Vincent Theron'
maintainer_email 'vptheron@gmail.com'
license          'Apache 2.0'
description      'Installs and configures IntelliJ IDEA'
long_description 'Please refer to README.md'
version          '0.6.0-SNAPSHOT'

recipe 'default', 'Downloads, installs and configures IntelliJ IDEA.'

depends 'java'

source_url 'https://github.com/vptheron/chef-idea' if respond_to?(:source_url)
issues_url 'https://github.com/vptheron/chef-idea/issues' if respond_to?(:issues_url)
