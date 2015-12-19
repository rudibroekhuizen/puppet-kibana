# == Class: kibana::service
#
class kibana::service {

  file { 'kibana init':
    content => template('kibana/init.erb'),
    path    => '/etc/init.d/kibana',
    mode    => '0775',
  }
  
  file {'kibana log directory':
    ensure => directory,
    path   => '/var/log/kibana',
    before => Service['kibana']
  }

  service {'kibana':
    ensure    => running,
    subscribe => File['init'],
  }
  
}
