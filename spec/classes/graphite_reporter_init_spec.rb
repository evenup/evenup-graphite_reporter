require 'spec_helper'

describe 'graphite_reporter', :type => :class do
  let (:facts) {{ :is_pe => false }}
  it { should create_class('graphite_reporter') }

  context 'when being applied on pe' do
    let (:facts) {{ :is_pe => true }}
    it { should contain_file('/etc/puppetlabs/puppet/graphite.yaml').with(
        :owner => 'pe_puppet',
        :group => 'pe_puppet',
        :mode  => '0444',
      )}
  end

  context 'when being applied on poss' do
    let (:facts) {{ :is_pe => false }}
    it { should contain_file('/etc/puppet/graphite.yaml').with(
        :owner => 'puppet',
        :group => 'puppet',
        :mode  => '0444',
      )}

  end

  context 'puppet 4' do
    let(:facts) { { :puppetversion => '4.0.0' } }
    it { should contain_file('/etc/puppetlabs/puppet/graphite.yaml').with(:owner => 'puppet') }
  end

end

