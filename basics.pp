node 'default' {

exec { 'apt-update' :
  command => '/usr/bin/apt-get update'
}

host { 'host entry puppet':
  name => "puppet",
  ensure => "present",
  comment => "sample entry untill dns is correct",
  ip => "178.128.185.7",
}

$packages =  ['git', 'iperf3', 'speedtest-cli', 'nuttcp', 'nmap', 'netcat']
package { $packages:
  ensure => "installed"
}

#include ntp
class { 'ntp':
  servers => [ '0.ubuntu.pool.ntp.org', '1.ubuntu.pool.ntp.org', 'tick.shastalink.k12.ca.us','tock.shastalink.k12.ca.us']
}


}
