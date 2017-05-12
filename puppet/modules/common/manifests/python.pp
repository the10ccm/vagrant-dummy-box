class common::python {
    notify { '### Python packages ###': }
    package { ["python-dev", "python-ipdb", "fabric"]:
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "python-pip":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    exec { "pip-update":
      command => 'pip install -U pip',
      path => "/usr/bin:/usr/local/bin",
      require => Package["python-pip"],
    }
    package { "python-mysqldb":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    exec { "MySQL-python":
      command => 'pip install MySQL-python',
      path => "/usr/bin:/usr/local/bin",
      require => Exec["pip-update"],
    }
    file { "/usr/bin/pip":
      ensure  => "link",
      target  => "/usr/local/bin/pip",
      require => Exec["pip-update"],
    }

}
