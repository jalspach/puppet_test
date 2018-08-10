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

vcsrepo { "/home/pi/git/Site-Tester/":
  ensure => present,
  provider => git,
  source => "https://github.com/jalspach/Site-Tester.git",
}

file { '/home/pi/git/Site-Tester/eesd-test.sh'
  ensure => 'link',
  target => '/usr/local/sbin/eesd-test.sh'
}
file { '/home/pi/git/Site-Tester/server.sh'
  ensure => 'link',
  target => '/usr/local/sbin/eesd-test_server.sh'
}
# add puppet configs, default ssh keys (maybe not on a public git server though), git pull of testing script, correct ntp to local ntp servers, ping matric (use puppet.db to consolidate this info.)
}
