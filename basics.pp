node 'default' {

exec { 'apt-update' :
  command => '/usr/bin/apt-get update'
}

exec { 'autoremove' :
  command => '/usr/bin/apt-get autoremove'
}

exec { 'autoclean' :
  command => '/usr/bin/apt-get autoclean'
}

host { 'host entry puppet' :
  ensure  => 'present',
  name    => 'puppet',
  comment => 'sample entry untill dns is correct',
  ip      => '10.1.3.169',
}

#include and configure ntp
class { 'ntp' :
  servers => [ '0.ubuntu.pool.ntp.org', '1.ubuntu.pool.ntp.org', 'tick.shastalink.k12.ca.us','tock.shastalink.k12.ca.us']
}

$packages =  ['localepurge', 'curl']
package { $packages :
  ensure => 'installed'
}

exec { 'Krypton_install' :
  command => '/usr/bin/curl https://krypt.co/kr | sh'
}

$nameservers = ['10.1.3.133', '10.0.128.133']
file { '/etc/resolv.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  content => termplate('resolver/resolv.conf.erb')
  }

# add puppet configs, default ssh keys (maybe not on a public git server though), git pull of testing script, correct ntp to local ntp servers, ping matric (use puppet.db to consolidate this info.)
}
