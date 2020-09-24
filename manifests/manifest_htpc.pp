node default {
  # New modules can be found here
  # https://forge.puppet.com/

  package { 'systemd': ensure => present, } #required for auto mount cifs shares

  ##############################################
  ########## Common ############################
  ##############################################

  package { 'nano': ensure => present, }

  package { 'wget': ensure => present, }

  ##############################################
  ########## Java ##############################
  ##############################################

  #include oraclejdk8
  
  # create a directories
  #file { '/usr/java': ensure => 'directory', }
  #file { '/usr/java/downloads': ensure => 'directory', }

  #jdk7::install7{ 'jdk1.8.0':
  #  version               => "8" ,
  #  full_version          => "jdk1.8.0",
  #  alternatives_priority => 19000,
  #  x64                   => true,
  #  java_homes            => '/usr/java/'
  #  download_dir          => "/usr/java/downloads",
  #  urandom_java_fix      => true,
  #  rsa_key_size_fix      => false,
  #  source_path           => "/software",
  #}



  ##############################################
  ########## Networking ########################
  ##############################################

  # Access from Internet (DYNDNS)
  package { 'ddclient': ensure => present, }
  package { 'libio-socket-ssl-perl': ensure => present, }



  ##############################################
  ########## Apache/WWW ########################
  ##############################################

  # package { 'apache2': ensure => present, }  
  # class { 'apache': default_vhost => true,}

  # apache::mod { 'ldap': }
  # apache::mod { 'proxy': }
  # apache::mod { 'proxy_html': }
  # apache::mod { 'proxy_http': }
  # apache::mod { 'rewrite': } #for redirect of http to https
  # apache::mod { 'ssl': }

  # file { '/var/www/html': ensure => 'directory', }
  # apache::vhost { 'default-ssl':
  #   port       => 443,
  #   docroot    => '/var/www/ssl',
  #   ssl        => true,
  #   ssl_cert   => '/etc/apache2/ssl/apache.cert',
  #   ssl_key    => '/etc/apache2/ssl/apache.key',
  #   options    => ['Indexes','FollowSymLinks','MultiViews'],
  #   proxy_pass => [
  #                   { 'path' => '/nzbget', 'url' => 'http://127.0.0.1:6789/nzbget' },
  #                   { 'path' => '/kodi', 'url' => 'http://127.0.0.1:8080' },
  #                   { 'path' => '/kodi/jsonrpc', 'url' => 'http://127.0.0.1:8080/jsonrpc' },
  #                   #{ 'path' => '/kodi/*', 'url' => 'http://127.0.0.1:8080/*' },
  #                 ],
  #   rewrite_rule => '^/nzbget$ /nzbget/',
  # }


  package { 'mariadb-server': ensure => present, }
  package { 'mariadb-client': ensure => present, }
  #package { 'php5': ensure => present, }
  #package { 'libapache2-mod-php5': ensure => present, }



  ##############################################
  ########## Mounting ##########################
  ##############################################

  package { 'nfs-common': ensure => present, }
  package { 'portmap': ensure => present, }

  file { '/mnt/nas.media': ensure => 'directory', owner => 1000, group => 1000 }
  fstab { 'Auto mount //192.168.2.201/Media':
    source => '192.168.2.201:/volume1/Media',
    dest   => '/mnt/nas.media',
    type   => 'nfs',
    opts   => 'auto,rw,rsize=8192,wsize=8192',
    dump   => 0,
    passno => 0,
  }

  file { '/mnt/nas.media_serving': ensure => 'directory', owner => 1000, group => 1000 }
  fstab { 'Auto mount //192.168.2.201/Media.Serving':
    source => '192.168.2.201:/volume1/Media.Serving',
    dest   => '/mnt/nas.media_serving',
    type   => 'nfs',
    opts   => 'auto,rw,rsize=8192,wsize=8192',
    dump   => 0,
    passno => 0,
  }


  ##############################################
  ########## Kodi ##############################
  ##############################################

  group { 'kodi':
    ensure => 'present',
  }

  user { 'kodi':
    ensure     => 'present',
    groups     => 'kodi',
    home       => '/home/kodi',
    managehome => true,
    password   => '2c6b191ffb724a4c8b585beecc1200a2',
  }

  package { 'cec-utils': ensure => present, } # for pulse eight libcec
  package { 'kodi': ensure => present, }



  ##############################################
  ########## OpenHAB ##############################
  ##############################################

  #apt::key {'openhab2':
  #  source => 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab',
  #  id     => 'B3F8A0F3E8E6A328D65B6EA6DAE9A22A'
  #}



  ##############################################
  ########## Puppet ############################
  ##############################################

  #package { 'puppetserver': ensure => present, }
}
