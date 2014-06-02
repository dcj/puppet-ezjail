# == Class: ezjail
#
# Full description of class ezjail here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ezjail:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#

class ezjail (
  $jail_name = undef,
  $jail_ip = undef,
  $jail_archive = undef
  ) { 
  class { '::ezjail::package': } ->
  class { '::ezjail::config': } ->
  class { '::ezjail::initialize': } ->
  class { '::ezjail::create': 
    jail_name => $jail_name,
    jail_ip   => $jail_ip } ->
  class { '::ezjail::service': 
    jail_name => $jail_name }
}