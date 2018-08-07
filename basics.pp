node 'raspberrypi.shastalink.k12.ca.us' {

exec { 'apt-update' :
  command => '/usr/bin/apt-get update'
}
user { 'jalspach':
  ensure => present,
  uid    => '1007',
  gid    => '1007',
  shell  => '/bin/bash',
  home   => '/home/jalspach'
}

}
