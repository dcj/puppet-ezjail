class ezjail::initialize ( 
  $os_version = undef,
  ) {

  include ezjail::params

  exec { 'ezjail_admin_install':
#   command => "$::ezjail::params::prefix/bin/ezjail-admin install -mp -r $::ezjail::params::os_version_default",
    command => "$::ezjail::params::prefix/bin/ezjail-admin install -mp",
    creates => "$::ezjail::params::jail_root/basejail",
  }

  file_line { 'ezjail_enable':
    line => 'ezjail_enable="YES"',
    path => '/etc/rc.conf',
  }

}
