$content = "Hello, Puppet! from template"

file { '/tmp/hello_puppet_template.txt':
  content => template('hello_puppet_template.erb')
}
