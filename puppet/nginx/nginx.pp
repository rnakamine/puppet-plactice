yumrepo { 'nginx':
  descr    => 'nginx yum repository',
  baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => 'https://nginx.org/keys/nginx_signing.key'
}

package { 'nginx':
  ensure  => installed,
  require => Yumrepo['nginx'],
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
