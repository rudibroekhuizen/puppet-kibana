# == Class: kibana::service
#
class kibana::service {

  file { 'init':
    content => template('kibana/init.erb'),
    path    => '/etc/init.d/kibana',
    mode    => '0775',
  }

  service {'kibana':
    ensure    => running,
    subscribe => File['init'],
  }
  
}
