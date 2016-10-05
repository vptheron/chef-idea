require 'spec_helper'

describe 'idea::default' do
  context 'using version 2016.2.3 and setup_dir /opt' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.default['idea']['version'] = '2016.2.3'
        node.default['idea']['setup_dir'] = '/opt'
      end.converge(described_recipe)
    end

    it 'creates /usr/share/applications/idea.desktop template' do
      expect(chef_run).to create_template('/usr/share/applications/idea.desktop')
    end

    it 'installs package idea from archive' do
      expect(chef_run).to install_ark('idea')
    end

    it 'creates /opt/idea-2016.2.3/bin/idea64.vmoptions' do
      expect(chef_run).to create_template('/opt/idea-2016.2.3/bin/idea64.vmoptions')
    end
  end
end
