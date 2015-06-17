-*- mode: markdown; mode: visual-line;  -*-

# Kernel Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/kernel.svg)](https://forge.puppetlabs.com/ULHPC/kernel)
[![License](http://img.shields.io/:license-GPL3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)
[![Documentation Status](https://readthedocs.org/projects/ulhpc-puppet-kernel/badge/?version=latest)](https://readthedocs.org/projects/ulhpc-puppet-kernel/?badge=latest)

Configure various aspects of Linux kernel (modules etc.)

      Copyright (c) 2015 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team <hpc-sysadmins@uni.lu>
      

| [Project Page](https://github.com/ULHPC/puppet-kernel) | [Sources](https://github.com/ULHPC/puppet-kernel) | [Documentation](https://ulhpc-puppet-kernel.readthedocs.org/en/latest/) | [Issues](https://github.com/ULHPC/puppet-kernel/issues) |

## Synopsis

Configure various aspects of Linux kernel (modules etc.).

This module implements the following elements: 

* __Puppet classes__:

* __Puppet definitions__: 

All these components are configured through a set of variables you will find in
[`manifests/params.pp`](manifests/params.pp). 

_Note_: the various operations that can be conducted from this repository are piloted from a [`Rakefile`](https://github.com/ruby/rake) and assumes you have a running [Ruby](https://www.ruby-lang.org/en/) installation.
See `docs/contributing.md` for more details on the steps you shall follow to have this `Rakefile` working properly. 

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on 

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

## Overview and Usage

### Class `kernel`

This is the main class defined in this module.
It accepts the following parameters: 

* `$ensure`: default to 'present', can be 'absent'

Use it as follows:

     include ' kernel'

See also [`tests/init.pp`](tests/init.pp)



## Librarian-Puppet / R10K Setup

You can of course configure the kernel module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/kernel"

or, if you prefer to work on the git version: 

     mod "ULHPC/kernel", 
         :git => 'https://github.com/ULHPC/puppet-kernel',
         :ref => 'production' 

## Issues / Feature request

You can submit bug / issues / feature request using the [ULHPC/kernel Puppet Module Tracker](https://github.com/ULHPC/puppet-kernel/issues). 

## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module is organized. 
These elements are detailed on [`docs/contributing.md`](contributing/index.md).

You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Puppet modules tests within a Vagrant box

The best way to test this module in a non-intrusive way is to rely on [Vagrant](http://www.vagrantup.com/).
The `Vagrantfile` at the root of the repository pilot the provisioning various vagrant boxes available on [Vagrant cloud](https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=virtualbox&q=svarrette) you can use to test this module.

See [`docs/vagrant.md`](vagrant.md) for more details. 

## Online Documentation

[Read the Docs](https://readthedocs.org/) aka RTFD hosts documentation for the open source community and the [ULHPC/kernel](https://github.com/ULHPC/puppet-kernel) puppet module has its documentation (see the `docs/` directly) hosted on [readthedocs](http://ulhpc-puppet-kernel.rtfd.org).

See [`docs/rtfd.md`](rtfd.md) for more details.

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.


[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
