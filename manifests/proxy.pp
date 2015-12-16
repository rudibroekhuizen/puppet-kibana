# == Class: kibana::proxy
#
class kibana::proxy {

  class { 'nginx': }

  nginx::resource::upstream { 'kibana': members => ['localhost:5601', ],}
  nginx::resource::vhost { 'kibana':
    proxy                => 'http://localhost:5601',
    auth_basic           => 'Restricted Content',
    auth_basic_user_file => '/etc/nginx/.htpasswd'
  }

}
