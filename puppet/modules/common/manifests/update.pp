class common::update {
    notify { '### Update packages ###': }
    exec { "apt-get update":
      command => 'apt-get -y update --fix-missing',
      path => "/usr/bin",
    }
    #package { 'apt-transport-https':
    #  ensure  => present,
    #  require => Exec["apt-get update"],
    #}
    #exec { "apt-get upgrade":
    #  command => 'apt-get -y --fix-missing --fix-broken upgrade',
    #  path => "/usr/bin",
    #  require => Exec["apt-get update"],
    #  #require => Package['apt-transport-https']
    #}

}