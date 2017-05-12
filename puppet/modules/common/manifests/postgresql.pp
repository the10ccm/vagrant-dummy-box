class common::postgresql {
    notify { '### Postgresql packages ###': }

    package { ["postgresql", "postgresql-server-dev-9.1"]:
      ensure  => present,
      require => Exec["apt-get update"],
    }

}