node 'default' {

exec { 'apt-update' :
  command => '/usr/bin/apt-get update'
}

exec { 'autoremove' :
  command => 'usr/bin/apt-get autoremove'
}

exec { 'autoclean' :
  command => 'usr/bin/apt-get autoclean'
}

host { 'host entry puppet' :
  ensure  => 'present',
  name    => 'puppet',
  comment => 'sample entry untill dns is correct',
  ip      => '178.128.185.7',
}

#include and configure ntp
class { 'ntp' :
  servers => [ '0.ubuntu.pool.ntp.org', '1.ubuntu.pool.ntp.org', 'tick.shastalink.k12.ca.us','tock.shastalink.k12.ca.us']
}

$packages =  ['localepurge']
package { $packages :
  ensure => 'installed'
}

# add puppet configs, default ssh keys (maybe not on a public git server though), git pull of testing script, correct ntp to local ntp servers, ping matric (use puppet.db to consolidate this info.)
}
