class common {
    notify { '### Common packages ###': }

    class {'common::update':}
    class {'common::system':}
    class {'common::python':}
    class {'common::web':}
    class {'common::mysql':}
    class {'common::postgresql':}
}
