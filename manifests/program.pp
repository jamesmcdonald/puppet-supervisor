define supervisor::program(
    $command,
    $directory = undef,
    $user = undef,
    $ensure = present,
    $environment = undef,
) {
    include supervisor
    Class['supervisor'] -> Supervisor::Program[$title]

    file {"/etc/supervisor/conf.d/program_${name}.conf":
        ensure  => $ensure,
        content => template('supervisor/program.conf.erb'),
        require => Class['supervisor'],
        notify  => Supervisor::Supervisorctl["program_${name}_reload"],
    }
    supervisor::supervisorctl {"program_${name}_reload":
        command => 'reload',
    }
    supervisor::service {"${name}":}
}

# A supporting type for supervisor::program. One of these will automatically be
# created with the same name as the program to allow restarts of that program
define supervisor::service(
) {
    supervisor::supervisorctl {"program_${name}_restart":
        program => $name,
        command => 'restart',
    }
}
