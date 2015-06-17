# File::      <tt>init.pp</tt>
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
    info ('Configuring GNU/linux kernel')

    case $::operatingsystem {
        debian, ubuntu:         { include kernel::common::debian }
        redhat, fedora, centos: { include kernel::common::redhat }
        default: {
            fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }
}
