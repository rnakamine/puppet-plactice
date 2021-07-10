# puppet-plactice

```
$ vagrant up
$ vagrant ssh
[vagrant@localhost ~]$ sudo yum -y update kernel
[vagrant@localhost ~]$ exit
$ vagrant reload --provision
```

### Install Puppet Client
```
$ vagrant ssh
[vagrant@localhost ~]$ sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
[vagrant@localhost ~]$ sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/puppetlabs.repo
[vagrant@localhost ~]$ sudo yum --enablerepo=puppetlabs-products,puppetlabs-deps -y install puppet
[vagrant@localhost ~]$ puppet version
```
