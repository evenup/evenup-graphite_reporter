require 'spec_helper'

describe 'graphite_reporter', :type => :class do

  context 'OSS' do
    let(:facts) { { :is_pe => false } }
    it { should create_class('graphite_reporter') }
    it { should contain_file('/etc/puppet/graphite.yaml').with(:owner => 'puppet', :group => 'puppet') }
  end

  context 'OSS' do
    let(:facts) { { :is_pe => true } }
    it { should create_class('graphite_reporter') }
    it { should contain_file('/etc/puppet/graphite.yaml').with(:owner => 'pe_puppet', :group => 'pe_puppet') }
  end


end

