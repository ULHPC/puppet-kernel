# File::      <tt>kernel-module.pp</tt>
# Author::    Sebastien Varrette (<Sebastien.Varrette@uni.lu>)
# Copyright:: Copyright (c) 2011 Sebastien Varrette (www[http://varrette.gforge.uni.lu])
# License::   GPLv3
#
# Time-stamp: <Tue 2011-10-04 22:37 svarrette>
# ------------------------------------------------------------------------------
# = Define: kernel::module
#
# This definition permits to handle loading/unloading Linux kernel modules and
#  also ensuring they are loaded automatically at boot.
# Resources: http://projects.puppetlabs.com/projects/1/wiki/Kernel_Modules_Patterns
#
# == Pre-requisites
#
# n/a
#
# == Parameters
#
# [*ensure*]
#   Present/Absent (default: $sysadmin::ensure)
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# [Remember: No empty lines between comments and class definition]
#
define kernel::module ($ensure = 'present') {

    # Check the value of teh ensure parameter
    if ! ($ensure in [ 'present', 'absent' ]) {
        fail("kernel::module 'ensure' parameter must be either absent or present")
    }

    include kernel
    include kernel::params

    # $name is provided by define invocation
    # guid of this entry
    $modulename = $name

    $insert_module_cmd = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => "echo '${modulename}' >> '${kernel::params::modulefile}'",
        /(?i-mx:centos|fedora|redhat|rocky)/ => "echo '${kernel::params::modprobe} ${modulename}' >> '${kernel::params::modulefile}' ",
    }

    $remove_module_cmd = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => "perl -ni -e 'print unless /^\\Q${modulename}\\E\$/' '${kernel::params::modulefile}'",
        /(?i-mx:centos|fedora|redhat|rocky)/ => "perl -ni -e 'print unless /^\\Q${kernel::params::modprobe} ${modulename}\\E\$/' '${kernel::params::modulefile}'",
    }

    $insert_unless_cmd = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/        => "grep -qFx '${modulename}' '${kernel::params::modulefile}'",
        /(?i-mx:centos|fedora|redhat|rocky)/ => "grep -q '^${kernel::params::modprobe} ${modulename}\$' '${kernel::params::modulefile}'",
    }

    # Let's go
    info("managing kernel module '${modulename}' (with ensure = ${ensure})")

    if ($ensure == 'present'){
        # Add the module in the modulefile (/etc/modules typically)
        exec { "insert_module_${modulename}":
            path    => '/sbin:/usr/bin:/usr/sbin:/bin',
            command => $insert_module_cmd,
            unless  => $insert_unless_cmd,
        }

        # Now run modprobe command
        exec { "modprobe ${modulename}":
            path    => '/sbin:/usr/bin:/usr/sbin:/bin',
            command => "${kernel::params::modprobe} ${modulename}",
            unless  => "/bin/grep -q '^${modulename} ' '/proc/modules'"
        }
    }
    else
    {
        # First run modprobe to unload the module
        exec { "modprobe -r ${modulename}":
            path    => '/sbin:/usr/bin:/usr/sbin:/bin',
            command => "${kernel::params::modprobe} -r ${modulename}",
            onlyif  => "/bin/grep -q '^${modulename} ' '/proc/modules'"
        }

        # Now remove the module from the modulefile (/etc/modules typically)
        exec { "remove_module_${modulename}":
            path    => '/sbin:/usr/bin:/usr/sbin:/bin',
            command => $remove_module_cmd,
            onlyif  => $insert_unless_cmd,
        }
    }
}


