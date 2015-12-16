# == Class: kibana::config
#
class kibana::config {

  # Set general settings for kibana.yml config file
  $kibana_hash_defaults = { 'path'              => '/opt/kibana/config/kibana.yml',
                            'key_val_separator' => ':',
	                  }

  # Set settings in /opt/kibana/config/kibana.yml
  create_ini_settings($kibana::kibana_hash, $kibana_hash_defaults)
  
}
