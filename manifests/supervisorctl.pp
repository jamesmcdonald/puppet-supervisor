# Build and execute supervisorctl commands
define supervisor::supervisorctl(
    $program = undef,
    $command,
    $refreshonly = true,
) {
    if $program {
        $cmdline = "/usr/bin/supervisorctl $command $program"
    } else {
        $cmdline = "/usr/bin/supervisorctl $command"
    }
    exec {"supervisorctl_${name}":
        refreshonly => $refreshonly,
        command     => $cmdline,
    }
}
