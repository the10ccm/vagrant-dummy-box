class common::mysql {
    notify { '### Mysql packages ###': }

    package { "mysql-server":
      ensure  => present,
      require => Exec["apt-get update"],
    }

    package { "libmysqlclient-dev":
      ensure  => present,
      require => Exec["apt-get update"],
    }

}