#
# Oisin Mulvihill
# 2013-07-29
#

class groonga::params {

    $file_base = "puppet:///modules/groonga"

    case $operatingsystem {
        centos: {
            $repo_setup = false
        }

        redhat: {
            $repo_setup = false
        }

        debian: {
            $repo_setup = true
            $repo_srcfile = "${file_base}/groonga.list"
            $repo_filename = "/etc/apt/sources.list.d/groonga.list"
            $repo_updatecmd = 'sudo apt-get update && sudo apt-get -y --allow-unauthenticated install groonga-keyring && sudo apt-get update'
        }

        ubuntu: {
            $repo_setup = true
            $repo_srcfile = "${file_base}/groonga.list"
            $repo_filename = "/etc/apt/sources.list.d/groonga.list"
            $repo_updatecmd = 'sudo apt-get update && sudo apt-get -y --allow-unauthenticated install groonga-keyring && sudo apt-get update'
        }

        default: {
            $repo_setup = false
        }
    }

}