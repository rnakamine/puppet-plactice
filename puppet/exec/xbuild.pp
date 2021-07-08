package { 'git': }

exec { 'xbuild':
  user    => 'vagrant',
  cwd     => '/home/vagrant',
  path    => ['/usr/bin'],
  command => 'git clone git://github.com/tagomoris/xbuild.git local/xbuild',
  creates => '/home/vagrant/local/xbuild',
  require => Package['git'],
}

exec { 'xbuild ruby':
  user        => 'vagrant',
  cwd         => '/home/vagrant',
  environment => ['USER=vagrant'],
  path        => ['/bin', '/usr/bin', '/home/vagrant/local/xbuild'],
  command     => 'ruby-install 2.6.7 /home/vagrant/local/ruby-2.6.7',
  creates     => '/home/vagrant/local/ruby-2.6.7',
  require     => Exec['xbuild'],
}
