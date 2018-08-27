node 'default' {
  include ntp
exec { 'apt-update' :
  command => '/usr/bin/apt-get update',
}

exec { 'autoremove' :
  command => '/usr/bin/apt-get autoremove',
}

exec { 'autoclean' :
  command => '/usr/bin/apt-get autoclean',
}

host { 'host entry puppet server' :
  ensure       => 'present',
  name         => 'puppet.shastalink.k12.ca.us',
  host_aliases => 'puppet',
  comment      => 'Not necessary if the name can resolve.',
  ip           => '10.1.3.169',
}

include timezone,
class { 'timezone' :
  timezone => 'US/Pacific-New',
}

#include and configure ntp
include ntp,
class { 'ntp' :
  servers => [ '0.ubuntu.pool.ntp.org', '1.ubuntu.pool.ntp.org', 'tick.shastalink.k12.ca.us','tock.shastalink.k12.ca.us'],
}

$packages =  ['localepurge', 'curl', 'dnstop', 'dnsutils' ]
package { $packages :
  ensure => 'installed',
}

exec { 'Krypton_install' :
  command => '/usr/bin/curl https://krypt.co/kr | sh',
}

# $nameservers = ['10.1.3.133', '10.0.128.133']
# file { '/etc/resolv.conf':
#   ensure => file,
#   owner => 'root',
#   group => 'root',
#   mode => '0644',
#   content => template('resolver/resolv.conf.erb')
#   }

exec { 'Agent_autostart' :
  command => '/opt/puppet/bin/puppet resource service puppet ensure=running enable=true',
}

class { 'motd':
  content => 'This PI managed by puppet/n',
  }



# add puppet configs, default ssh keys, correct ntp to local ntp servers.
}
