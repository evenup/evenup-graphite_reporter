require 'puppet'
require 'yaml'
require 'socket'
require 'time'

Puppet::Reports.register_report(:graphite) do

  configfile = File.join([File.dirname(Puppet.settings[:config]), "graphite.yaml"])
  raise(Puppet::ParseError, "Graphite report config file #{configfile} not readable") unless File.exist?(configfile)
  config = YAML.load_file(configfile)
  GRAPHITE_SERVER = config[:graphite_server]
  GRAPHITE_PORT = config[:graphite_port]
  GRAPHITE_PREFIX = config[:graphite_prefix]
  GRAPHITE_SUFFIX = config[:graphite_suffix]
  GRAPHITE_REVERSE_HOSTNAME = config[:graphite_reverse_hostname]

  desc <<-DESC
  Send notification of failed reports to a Graphite server via socket.
  DESC

  def send_metric payload
    socket = TCPSocket.new(GRAPHITE_SERVER, GRAPHITE_PORT)
    socket.puts payload
    socket.close
  end

  def process
    Puppet.debug "Sending status for #{self.host} to Graphite server at #{GRAPHITE_SERVER}"

    prefix_parts = Array.new

    if GRAPHITE_PREFIX != nil
      prefix_parts.push GRAPHITE_PREFIX
    end

    if GRAPHITE_REVERSE_HOSTNAME
      prefix_parts.push self.host.split(".").reverse.join(".")
    else
      prefix_parts.push self.host
    end

    if GRAPHITE_SUFFIX != nil
      prefix_parts.push GRAPHITE_SUFFIX
    end

    prefix = prefix_parts.join(".")

    epochtime = Time.now.utc.to_i
    self.metrics.each { |metric,data|
      data.values.each { |val|
        name = "#{prefix}.#{val[1]}.#{metric}"
        value = val[2]

        send_metric "#{name} #{value} #{epochtime}"
      }
    }
  end
end
