

$packages =  ['git', 'iperf3', 'speedtest-cli', 'nuttcp', 'nmap', 'netcat']
package { $packages:
  ensure => 'installed'
}

vcsrepo { '/home/pi/git/Site-Tester/':
  ensure   => latest, #WARNING - This overwrites any local changes to the repository.
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

cron { 'throughput_testing':
  command => '/usr/local/sbin/eesd_tests.sh',
  user    => 'root',
  minute  => '*/5',
}
