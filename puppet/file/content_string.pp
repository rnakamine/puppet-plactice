$content = "Hello, Puppet!!1"

file { '/tmp/hello_puppet.txt':
  content => template('hello_puppet_template.erb')
}

file { '/etc/nginx/site-available':
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

file { '/etc/nginx/site-enabled':
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

file { '/etc/nginx/site-available/mysite.conf':
  ensure => present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}

file { '/etc/nginx/site-enabled/mysite.conf':
  ensure  => link,
  target  => 'etc/nginx/site-available/mysite.conf',
  owner   => 'root',
  group   => '0644',
  require => File['/etc/nginx/site-available/mysite.conf'],
}
