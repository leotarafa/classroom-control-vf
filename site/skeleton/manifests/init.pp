class skeleton {
  ensure => present,
  }
  file { '/etc/skel':
  ensure => directory,
  }
  file { '/etc/skel/.bashrc':
  ensure => file,
  source => 'puppet:///modules/skel/.bashrc',
  }
}
