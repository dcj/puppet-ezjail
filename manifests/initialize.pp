class ezjail::initialize ( 
  $os_version = 'FreeBSD 10.0-RELEASE' 
  ) {

  include ezjail::params

  exec { 'ezjail_admin_install':
    command  => "/usr/local/bin/ezjail-admin install -mp -r \"${os_version}\" ",
    creates => "/usr/jails/basejail",
  }

  # file_line { 'ezjail_enable':
  #   line => 'ezjail_enable="YES"',
  #   path => '/etc/rc.conf',
  # }

}
