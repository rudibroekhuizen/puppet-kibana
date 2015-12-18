# == Class: kibana::package
#
class kibana::package {

# Download and unpack kibana
  archive { 'kibana':
    ensure           => present,
    checksum         => false,
    target           => $kibana::install_dir,
    url              => $kibana::download_url,
    strip_components => 1,
  }

}
