## site.pp ##

## Active Configurations ##


## Disable filebucket by default for all File resources:
File { backup => false }

## Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

## DEFAULT NODE
node default {
  include users
  include skeleton
  include cowsay_motd
  include notify
  }
#Node definition for leotarafa.puppetlabs.vm
node leotarafa.puppetlabs.vm {
  include users
  include skeleton
  include notify
  include cowsay_motd
  include memcached
  include nginx
  host { 'testing.puppetlabs.vm':
    comment => "This file is modified by Puppet. Manual changes will be overwritten.",
    ip => '127.0.0.1',
    ensure => present,
    host_aliases => 'testing',
    }
  if '$::is_virtual' {
    $vmtype_caps = capitalize '$::is_virtual'
  notify { "This is a ${vmtype_caps} VM": }
  }
}