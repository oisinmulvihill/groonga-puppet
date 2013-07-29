#

class groonga::setuprepo {

    if ($groonga::params::repo_setup) {

        file { 'repo-setup-file' :
            path => $groonga::params::repo_filename,
            source => $groonga::params::repo_srcfile,
            mode  => 0644,
        }

        exec { 'update-repo' :
            path => '/bin:/usr/bin:/usr/local/bin',
            command => $groonga::params::repo_updatecmd,
            require => File['repo-setup-file']
        }

    } else {
        notice("Package repository skipped for this platform.")
    }
}