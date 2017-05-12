class common::web {
    notify { '### WEB packages ###': }
    #package { "npm":
    #  ensure  => present,
    #  require => Exec["apt-get update"],
    #}
    package { "nodejs":
      ensure  => present,
      require => Exec["apt-get update"],
    }

}
