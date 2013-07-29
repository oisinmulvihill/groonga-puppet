
class groonga::install (
    $start_service = true,
    $service_ensure = 'running',
    $gcs_name = 'gcs',
    $gcsconsole_name = 'gcs-console',
) {

    if ($groonga::params::repo_setup) {

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

    } else {
        notice("Nothing installed as package isn't supported on this platform.")
    }

}
