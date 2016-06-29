class nginx {
  package { 'nginx':
    ensure => latest,
    }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['ngingx'],
    }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['ngingx'],
    }
  file { 'var/www':
    ensure => directory,
    path => '/var/www',
    }
  file { 'index.html':
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html'
    }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => {
      File['nginx.conf']
      File['default.conf']
      }
    }
