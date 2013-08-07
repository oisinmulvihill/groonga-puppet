#
# Oisin Mulvihill
# 2013-07-29
#

class groonga::params {
    $rh_uri_base = 'http://packages.groonga.org/centos'

    $file_base = "puppet:///modules/groonga"

    $rh_repo = "${rh_uri_base}/groonga-release-1.1.0-1.noarch.rpm"

    $repo_srcfile = "${file_base}/groonga.list"
    $repo_filename = "/etc/apt/sources.list.d/groonga.list"
    $repo_updatecmd = 'sudo apt-get update && sudo apt-get -y --allow-unauthenticated install groonga-keyring && sudo apt-get update'

}