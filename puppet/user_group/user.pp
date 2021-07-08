user { 'naryo':
  ensure     => present,
  comment    => 'naryo',
  home       => '/home/naryo',
  managehome => true,
  shell      => '/bin/bash',
}
