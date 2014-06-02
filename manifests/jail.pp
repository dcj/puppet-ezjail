define ezjail::jail ( 
  $ip   = undef,
  ) {

  include ezjail
                         
  exec { "ezjail_${name}":
    command  => "/usr/local/bin/ezjail-admin create -c zfs ${name} ${ip}",
    creates  => "$::ezjail::params::jail_root/${name}",
    require  => Class [ 'ezjail::initialize' ],
  }

  service { "ezjail_${name}":
    ensure    => running,
    name      => 'ezjail',
    enable    => true,
    hasstatus => false,
    start     => "/usr/local/bin/ezjail-admin start ${name}",
    stop      => "/usr/local/bin/ezjail-admin stop ${name}",
    restart   => "/usr/local/bin/ezjail-admin restart ${name}",
    status    => "/usr/local/bin/ezjail-admin console -e /usr/bin/true ${name}",
  }

  Exec[ "ezjail_${name}" ] -> Service [ "ezjail_${name}" ]

}

























