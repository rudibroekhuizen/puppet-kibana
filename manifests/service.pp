# == Class: kibana::service
#
class kibana::service {

# Create init script  
  file { 'kibana init':
    content => template('kibana/init.erb'),
    path    => '/etc/init.d/kibana',
    mode    => '0775',
  }
  
# Create log directory
  file {'kibana log directory':
    ensure => directory,
    path   => '/var/log/kibana',
    before => Service['kibana']
  }

# Start service
  service {'kibana':
    ensure    => running,
    subscribe => File['kibana init'],
  }
  
}
