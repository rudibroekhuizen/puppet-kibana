# == Class: kibana::proxy
#
class kibana::proxy {

  class { 'nginx': }

  # Create password file
  httpauth { 'kibana':
    file      => '/etc/nginx/.htpasswd',
    password  => $kibana::kibana_password,
    mechanism => basic,
    ensure    => present,
    notify    => Service['nginx'],
    require   => Class['nginx::config'],
  }

  # Set correct permissions on password file
  file { '/etc/nginx/.htpasswd':
    mode    => '0644',
    require => Httpauth['kibana']
  }

  # Create proxy
  nginx::resource::upstream { 'kibana':
    members => ['localhost:5601', ],
  }
  
  nginx::resource::vhost { 'kibana':
    proxy                => 'http://localhost:5601',
    auth_basic           => 'Restricted Content',
    auth_basic_user_file => '/etc/nginx/.htpasswd',
    require              => Httpauth['kibana']
  }
  
  # Nginx logging in json format
  class { 'nginx::config':
    log_format => {
      custom => '{ "@timestamp": "$time_iso8601", "http_host": "$http_host", "remote_addr": "$remote_addr", "remote_user": "$remote_user", "bytes_sent": $bytes_sent, "body_bytes_sent": $body_bytes_sent, "request_length": $request_length, "request_time": $request_time, "status": "$status", "request": "$request", "request_method": "$request_method", "http_referrer": "$http_referer", "http_user_agent": "$http_user_agent" }'
    },
  }
}
