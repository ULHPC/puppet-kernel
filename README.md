# Kernel Puppet Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/kernel.svg)](https://forge.puppetlabs.com/ULHPC/kernel)
[![License](http://img.shields.io/:license-GPL3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Configure various aspects of Linux kernel (modules etc.)

      Copyright (c) 2026 UL HPC Team <hpc-sysadmins@uni.lu>


| [Project Page](https://github.com/ULHPC/puppet-kernel) | [Sources](https://github.com/ULHPC/puppet-kernel) | [Issues](https://github.com/ULHPC/puppet-kernel/issues) |

## Synopsis

Configure various aspects of Linux kernel (modules etc.).

This module implements the following elements:

* __Puppet classes__:
    - `kernel`
    - `kernel::common`
    - `kernel::common::debian`
    - `kernel::common::redhat`
    - `kernel::params`

* __Puppet definitions__:
    - `kernel::module`

All these components are configured through a set of variables you will find in
[`manifests/params.pp`](manifests/params.pp).

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

### Definition `kernel::module`

The definition `kernel::module` provides ...
This definition accepts the following parameters:

* `$ensure`: default to 'present', can be 'absent'
* `$content`: specify the contents of the directive as a string
* `$source`: copy a file as the content of the directive.

Example:

        kernel::module { 'toto':
		      ensure => 'present',
        }

## Librarian-Puppet / R10K Setup

You can of course configure the kernel module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/kernel"

or, if you prefer to work on the git version:

     mod "ULHPC/kernel",
         :git => 'https://github.com/ULHPC/puppet-kernel',
         :ref => 'main'

## Developments / Issues / Contributing to the code

This Puppet Module has been implemented in the context of the [UL HPC](http://hpc.uni.lu) Platform of the [University of Luxembourg](http://www.uni.lu).
It relies on [Vox Pupuli modulesync](https://github.com/voxpupuli/modulesync) for its organization.

If you want to contribute to the code, you shall be aware of the way this module is organized.
These elements are detailed on [`docs/contributing.md`](contributing/index.md).

You can submit bugs / issues / feature requests using the [ULHPC/kernel Puppet Module Tracker](https://github.com/ULHPC/puppet-kernel/issues).
You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests).

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.


[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
