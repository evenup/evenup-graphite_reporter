# Class graphite_reporter::params
#
# Default parameters for graphite_reporter module
#
class graphite_reporter::params {
  $graphite_host = '127.0.0.1'
  $graphite_port = 2003

  $graphite_prefix = undef
  $graphite_suffix = 'puppet'
  $graphite_reverse_hostname = true
  $graphite_flatten_hostname = false

  if str2bool($::is_pe) {
    $config_file  = '/etc/puppetlabs/puppet/graphite.yaml'
    $config_owner = 'pe_puppet'
    $config_group = 'pe_puppet'
  } elsif versioncmp('4.0.0', $::puppetversion) < 1 {
    $config_file  = '/etc/puppetlabs/puppet/graphite.yaml'
    $config_owner = 'puppet'
    $config_group = 'puppet'
  } else {
    $config_file  = '/etc/puppet/graphite.yaml'
    $config_owner = 'puppet'
    $config_group = 'puppet'
  }
}
