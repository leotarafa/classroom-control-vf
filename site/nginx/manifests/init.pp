class nginx {
  package { 'nginx':
    ensure => latest,
    }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf'
    }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf'
    }
  file { 'var/www':
    ensure => directory,
    path => '/var/www',
    }
  file { 'index.html':
    ensure => file,
    path => '/var/www',
    source => 'puppet:///modules/nginx/index.html'
    }
  service { 'nginx':
    ensure => running,
    enable => true,
    }
  }
