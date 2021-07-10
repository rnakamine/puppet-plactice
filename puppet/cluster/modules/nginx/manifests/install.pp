class nginx::install {
  yumrepo { 'nginx':
    descr    => 'nginx yum repository',
    baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://nginx.org/keys/nginx_signing.key'
  }

  package { 'nginx':
    require => Yumrepo['nginx'],
  }

  file { '/var/log/nginx':
    ensure  => directory,
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0755',
    require => Package['nginx'],
  }
}
