#

class groonga::setuprepo {

    case $operatingsystem {
        /(?i)(centos|redhat)/: {
            notice('Ubuntu/Debian Groonga setuprepo.')

            # Centos set up:
            #  http://groonga.org/docs/install/centos.html
            #
            exec { 'rh-repo-setup' :
                path => '/bin:/usr/bin:/usr/local/bin',
                command => "rpm -ivh ${$groonga::params::rh_repo}",
                unless => 'rpm -qa | grep groonga'
            }

            exec { 'rh-repo-mkcache' :
                path => '/bin:/usr/bin:/usr/local/bin',
                command => "yum makecache",
                require => Exec['rh-repo-setup'],
                unless => 'find /etc/yum.repos.d/groonga.repo'
            }

        }

        /(?i)(ubuntu|debian)/: {
            notice('Ubuntu/Debian Groonga setuprepo.')

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
        }

        default: {
            fail("Unsupported OS '$operatingsystem'.")
        }
    }
}