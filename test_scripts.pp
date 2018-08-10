
node 'default' {

host { 'host entry puppet':
  ensure  => 'present',
  name    => 'puppet',
  comment => 'sample entry untill dns is correct',
  ip      => '178.128.185.7',
}

vcsrepo { '/home/pi/git/Site-Tester/':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/jalspach/Site-Tester.git',
}

file { '/usr/local/sbin/eesd-test.sh':
  ensure => link,
  target => '/home/pi/git/Site-Tester/eesd-test.sh',
  mode   => '0751',
}

file { '/usr/local/sbin/eesd-test_server.sh':
  ensure => link,
  target => '/home/pi/git/Site-Tester/server.sh',
  mode   => '0751',
}

}
