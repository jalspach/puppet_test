node '*' {

exec { 'apt-update' :
  command => '/usr/bin/apt-get update'
}
user { 'jalspach':
  ensure => present,
  uid    => '1000',
  gid    => '1000',
  shell  => '/bin/bash',
  home   => '/home/jalspach'
}

}
