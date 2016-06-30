class users::admins {
  users::managed_user { 'jose': }
  users::managed_user { 'alice':
    group => 'staff',
  }
  users::managed_user { 'chen':
    group => 'staff',
  }
  users::managed_user { 'buzz':
    group => 'admin',
  }
    group { 'staff':
    ensure => present,
  }
}