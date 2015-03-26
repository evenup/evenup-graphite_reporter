# Class graphite_reporter::params
#
# Default parameters for graphite_reporter module
#
class graphite_reporter::params {
  $graphite_host = '127.0.0.1'
  $graphite_port = 2003

  if $::is_pe {
    $config_file  = '/etc/puppetlabs/puppet/graphite.yaml'
    $config_owner = 'pe_puppet'
    $config_group = 'pe_puppet'
  } else {
    $config_file  = '/etc/puppet/graphite.yaml'
    $config_owner = 'puppet'
    $config_group = 'puppet'
  }
}
