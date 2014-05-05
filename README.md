puppet-supervisor
=================

This module installs the 'supervisor' package available on Debian, and enables
you to set up programs to run under supervisor. It is very basic and supports
only a tiny subset of supervisor's functionality for the moment.

Example
-------

```puppet
include supervisor

supervisor::program {'testservice':
    ensure  => present,
    command => '/opt/testservice/testservice.py',
    require => Vcsrepo['testservice'],
}   

vcsrepo {'testservice':
    path     => '/opt/testservice',
    provider => 'git',
    source   => 'http://github.com/jamesmcdonald/testservice.git',
    revision => 'master',
    ensure   => latest,
    notify   => Supervisor::Service['testservice'],
}   
```


License
-------


Contact
-------


Support
-------

