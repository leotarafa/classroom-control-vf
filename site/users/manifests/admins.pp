class users::admins {
  users::managed_user { 'jose': }
  users::managed_user { 'alice':
    group => 'staff',
  }
  users::managed_user { 'chen':
    group => 'staff',
  }
  users::managed_user { 'buzz':
    group => 'staff',
  }
    group { 'staff':
    ensure => present,
  }
}