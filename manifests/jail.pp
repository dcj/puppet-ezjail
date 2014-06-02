define ezjail::jail ( 
  $jail_name = undef,
  $jail_ip   = undef,
  ) {

  include ezjail
                         
  exec { "ezjail_${jail_name}":
    command  => "/usr/local/bin/ezjail-admin create -c zfs ${jail_name} ${jail_ip}",
    creates  => "$::ezjail::params::jail_root/${jail_name}",
    require  => Class [ 'ezjail::initialize' ],
  }

  service { "ezjail_${jail_name}":
    ensure    => running,
    name      => 'ezjail',
    enable    => true,
    hasstatus => false,
    start     => "/usr/local/bin/ezjail-admin start ${jail_name}",
    stop      => "/usr/local/bin/ezjail-admin stop ${jail_name}",
    restart   => "/usr/local/bin/ezjail-admin restart ${jail_name}",
    status    => "/usr/local/bin/ezjail-admin console -e /usr/bin/true ${jail_name}",
  }

  Exec[ "ezjail_${jail_name}" ] -> Service [ "ezjail_${jail_name}" ]

}

























