class ezjail::service (
  $jail_name = undef,
  ) {

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

}
