package { 'nginx':
  ensure  => installed,
}

$port = 80

file { '/etc/nginx/conf.d/my.conf':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('my.conf'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

$target = 'Puppet'

file { '/usr/share/nginx/html/index.html':
  ensure  => present,
  force   => true,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('index.html'),
  require => Package['nginx'],
}

service { 'nginx':
  enable     => true,
  ensure     => running,
  hasrestart => true,
  require     => File['/etc/nginx/conf.d/my.conf'],
}