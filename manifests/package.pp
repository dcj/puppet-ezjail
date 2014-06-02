class ezjail::package {

  package { 'ezjail':
    ensure   => installed,
    provider => pkgng,
  }

}




