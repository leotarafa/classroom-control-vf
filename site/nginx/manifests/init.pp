class nginx {
  package { 'nginx':
    ensure => latest,
    }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/etc/nginx/conf.d/default.conf'
    }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/etc/nginx/nginx.conf'
    }
  file { 'index.html':
    ensure => file,
    path => '/var/www',
    source => 'puppet:///modules/nginx/var/www/index.conf'
    }
  service { 'nginx':
    ensure => running,
    enable => true,
    }
  }
  
  
