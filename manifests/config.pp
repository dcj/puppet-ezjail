class ezjail::config {

  file { 'ezjail.conf':
    path    => '/usr/local/etc/ezjail.conf',
    ensure  => present,
    source  => 'puppet:///modules/ezjail/ezjail.conf',
    require => Package[ 'ezjail' ],
  }

  zfs { 'zroot/ezjail':
    ensure => 'present',
  }

}
