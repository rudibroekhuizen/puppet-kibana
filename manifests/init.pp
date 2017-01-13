# == Class: kibana
#
# Full description of class kibana here.
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
#  class { 'kibana':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class kibana (
  $download_url    = 'https://artifacts.elastic.co/downloads/kibana/kibana-5.1.2-amd64.deb',
  $install_dir     = '/usr/share/kibana',
  $kibana_password = 'password',
  $kibana_hash     = { '' => { 'host' => '"localhost"',
                             },
                     }
  
) {

  class { 'kibana::package':
  }

  class { 'kibana::config':
    require => Class['kibana::package']
  }
  
  class { 'kibana::proxy':
    require => Class['kibana::config']
  }

  class { 'kibana::service':
    require => Class['kibana::proxy']
  }

}
