user { 'rnakamine':
  ensure     => present,
  gid        => 'guest',
  comment    => 'rnakamine',
  home       => '/home/rnakamine',
  managehome => true,
  shell      => '/bin/bash',
}

group { 'guest':
  ensure => present,
  gid    => 10000
}
