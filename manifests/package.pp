# == Class: kibana::package
#
class kibana::package {

  archive { 'kibana':
    ensure   => present,
    checksum => false,
    target   => $kibana::install_dir,
    url      => $kibana::download_url,
    #notify   => Exec['chown_kibana_directory'],
  }
 
  #exec { 'chown_kibana_directory':
  #  command     => "chown -R ${kibana::kibana_user}:${kibana::kibana_group} ${kibana::install_dir}/kibana",
  #  path        => ['/bin','/sbin'],
  #  refreshonly => true,
  #  require     => $symlink_require,
  #}
  
}
