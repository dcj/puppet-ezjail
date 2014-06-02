class ezjail::create ( $jail_name = undef,
                       $jail_ip = undef ) {
  include ezjail::params
                         
  exec { "create_jail_${jail_name}":
    command  => "/usr/local/bin/ezjail-admin create -c zfs ${jail_name} ${jail_ip}",
    creates  => "$::ezjail::params::jail_root/${jail_name}",
    require  => Class [ 'ezjail::initialize' ],
  }

}

























