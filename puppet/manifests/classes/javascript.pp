class javascript {
    class { 'nodejs':
        version => 'v0.10.33'
    }
    package { 'bower':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'grunt-cli':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'yo':
        provider => npm,
        require => Class['nodejs']
    }
    package { 'generator-angular':
        provider => npm,
        ensure => installed,
        require => Package['yo']
    }
    package { 'generator-gulp-angular':
        provider => npm,
        ensure => installed,
        require => Package['yo']
    }
}
