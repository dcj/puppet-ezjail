define ezjail::jail ( 
  $ip   = undef,
  ) {

  include ezjail
                         
  exec { "ezjail_${name}":
    command  => "$::ezjail::params::prefix/bin/ezjail-admin create -c zfs ${name} ${ip}",
    creates  => "$::ezjail::params::jail_root/${name}",
    require  => Class [ 'ezjail::initialize' ],
  }

  service { "ezjail_${name}":
    ensure    => running,
    name      => 'ezjail',
    enable    => true,
    hasstatus => false,
    start     => "$::ezjail::params::prefix/bin/ezjail-admin start ${name}",
    stop      => "$::ezjail::params::prefix/bin/ezjail-admin stop ${name}",
    restart   => "$::ezjail::params::prefix/bin/ezjail-admin restart ${name}",
    status    => "$::ezjail::params::prefix/bin/ezjail-admin console -e /usr/bin/true ${name}",
  }

  Exec[ "ezjail_${name}" ] -> Service [ "ezjail_${name}" ]

}

























