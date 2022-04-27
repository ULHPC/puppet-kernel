# File::      <tt>kernel-params.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPL v3
#
# ------------------------------------------------------------------------------
# = Class: kernel::params
#
# In this class are defined as variables values that are used in other
# kernel classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# The usage of a dedicated param classe is advised to better deal with
# parametrized classes, see
# http://docs.puppetlabs.com/guides/parameterized_classes.html
#
# [Remember: No empty lines between comments and class definition]
#
class kernel::params {

    ######## DEFAULTS FOR VARIABLES USERS CAN SET ##########################
    # (Here are set the defaults, provide your custom variables externally)
    # (The default used is in the line with '')
    ###########################################


    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################
    $modulefile = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/ => '/etc/modules',
        default => '/etc/rc.modules',
    }

    $modulefile_mode = $::operatingsystem ? {
        /(?i-mx:centos|fedora|redhat|rocky)/ => '0755',
        default => '0644',
    }

    $modulefile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $modulefile_group = $::operatingsystem ? {
        default => 'root',
    }

    # $pkgmanager = $::operatingsystem ? {
    #     /(?i-mx:ubuntu|debian)/          => [ '/usr/bin/apt-get' ],
    #     /(?i-mx:centos|fedora|redhat|rocky)/ => [ '/bin/rpm', '/usr/bin/up2date', '/usr/bin/yum' ],
    #     default => []
    # }

    $modprobe =  $::operatingsystem ? {
        default => '/sbin/modprobe'
    }


}

