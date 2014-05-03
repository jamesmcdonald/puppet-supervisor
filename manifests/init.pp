# == Class: supervisor
#
# Install the supervisor package available on Debianish operating systems.
#
# === Parameters
#
# No parameters.
#
# === Variables
#
# No variables.
#
# === Examples
#
#  include supervisor
#
#  class { supervisor:
#  }
#
# === Authors
#
# James McDonald <james@jamesmcdonald.com>
#
# === Copyright
#
# Copyright 2014 James McDonald
#
class supervisor {
    if $::osfamily != 'Debian' {
        fail("The supervisor module is only built for Debian right now - please hack it if you know what you're doing")
    }
    package {'supervisor':
        ensure => installed,
    }
}
