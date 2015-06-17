# File::      <tt>init.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: kernel::common
#
# Base class to be inherited by the other kernel classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class kernel::common {

    # Load the variables used in this module. Check the kernel-params.pp file
    require kernel::params

    file { $kernel::params::modulefile:
        ensure => 'file',
        owner  => $kernel::params::modulefile_owner,
        group  => $kernel::params::modulefile_group,
        mode   => $kernel::params::modulefile_mode,
    }
}
