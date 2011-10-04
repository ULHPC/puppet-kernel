# File::      <tt>kernel.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: kernel
#
# Configure various aspects of Linux kernel (modules etc.)
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     import kernel
#
# You can then specialize the various aspects of the configuration,
# for instance:
#
#         include 'kernel'
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class kernel inherits kernel::params
{
    info ("Configuring GNU/linux kernel")

    case $::operatingsystem {
        debian, ubuntu:         { include kernel::debian }
        redhat, fedora, centos: { include kernel::redhat }
        default: {
            fail("Module $module_name is not supported on $operatingsystem")
        }
    }
}

# ------------------------------------------------------------------------------
# = Class: kernel::common
#
# Base class to be inherited by the other kernel classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class kernel::common {

    # Load the variables used in this module. Check the kernel-params.pp file
    require kernel::params

    file { "${kernel::params::modulefile}":
        ensure => 'file',
        owner  => "${kernel::params::modulefile_owner}",
        group  => "${kernel::params::modulefile_group}",
        mode   => "${kernel::params::modulefile_mode}",
    }
}


# ------------------------------------------------------------------------------
# = Class: kernel::debian
#
# Specialization class for Debian systems
class kernel::debian inherits kernel::common { }

# ------------------------------------------------------------------------------
# = Class: kernel::redhat
#
# Specialization class for Redhat systems
class kernel::redhat inherits kernel::common { }



