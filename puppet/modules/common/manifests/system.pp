class common::system {

    notify { '### System packages ###': }

    package { "debconf-utils":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "vim":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "libjpeg-dev":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "git":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { ["subversion", "mercurial"]:
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "make":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "gcc":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "libxml2-dev":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "libxslt1-dev":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    #file { "/usr/lib/i386-linux-gnu/libz.so":
    #  ensure  => "link",
    #  target  => "/usr/lib/libz.so",
    #  #require => Exec["libxslt1-dev"],
    #}
    #file { "/usr/lib/libz.so":
    #  ensure  => "link",
    #  target  => "/usr/lib/x86_64-linux-gnu/libz.so",
    #}
    package { "curl":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "tree":
      ensure  => present,
      require => Exec["apt-get update"],
    }
    package { "tmux":
      ensure  => present,
      require => Exec["apt-get update"],
    }
}
