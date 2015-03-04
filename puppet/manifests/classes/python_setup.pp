# install python
class python_setup {
    case $operatingsystem {
        ubuntu: {
            package { "python-pip":
                ensure => installed
            }
            package { 'fig':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
            package { 'fabric':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
            package { 'kafka-python':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
# may not be needed
            package { 'docker-py':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
        }
    }
}
