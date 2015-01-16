require 'spec_helper'

describe 'graphite_reporter', :type => :class do
  it { should create_class('graphite_reporter') }

  context 'when being applied on pe' do
    let (:facts) {{ :is_pe => true }}
    it do
      should contain_file('/etc/puppetlabs/puppet/graphite.yaml').with({
        'owner' => 'pe_puppet',
        'group' => 'pe_puppet',
        'mode'  => '0444',
      })
    end
  end

  context 'when being applied on poss' do
    let (:facts) {{ :is_pe => false }}
    it do
      should contain_file('/etc/puppet/graphite.yaml').with({
        'owner' => 'puppet',
        'group' => 'puppet',
        'mode'  => '0444',
      })
    end
  end


end

