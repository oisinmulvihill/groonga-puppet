#
# Oisin Mulvihill
# 2013-07-29
#

class groonga::install (
    $start_service = true,
    $service_ensure = 'running',
    $gcs_name = 'gcs',
    $gcsconsole_name = 'gcs-console',
) {


    case $operatingsystem {
        /(?i)(centos|redhat)/: {
            notice('Redhat/Centos Groonga install.')

            # Centos set up:
            #  http://groonga.org/docs/install/centos.html
            #
            package {
                'groonga': ensure => installed;
            }

        }

        /(?i)(ubuntu|debian)/: {
            notice('Ubuntu/Debian Groonga install.')

            package {
                'gcs': ensure => installed;
                'gcs-console': ensure => installed;
            }

            service { $gcs_name:
                ensure => $service_ensure,
                name => $gcs_name,
                enable => $start_service,
                require => Package['gcs'],
            }

            service { $gcsconsole_name:
                ensure => $service_ensure,
                name => $gcsconsole_name,
                enable => $start_service,
                require => Package['gcs-console'],
            }

            Package['gcs', 'gcs-console'] ~> Service['gcs', 'gcs-console']
        }

        default: {
            fail("Unsupported OS '$operatingsystem'.")
        }
    }

}
