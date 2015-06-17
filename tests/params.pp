# File::      <tt>params.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2015 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'kernel::params'

$names = ['modulefile', 'modulefile_mode', 'modulefile_owner', 'modulefile_group', 'modprobe']

notice("kernel::params::modulefile = ${kernel::params::modulefile}")
notice("kernel::params::modulefile_mode = ${kernel::params::modulefile_mode}")
notice("kernel::params::modulefile_owner = ${kernel::params::modulefile_owner}")
notice("kernel::params::modulefile_group = ${kernel::params::modulefile_group}")
notice("kernel::params::modprobe = ${kernel::params::modprobe}")

#each($names) |$v| {
#    $var = "kernel::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
