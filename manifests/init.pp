#

class groonga (
    $start_service = true,
    $service_ensure = 'running',
) {
    include groonga::params
    include groonga::setuprepo

    class { 'groonga::install':
        start_service => $start_service,
        service_ensure => $service_ensure,
    }

    Class['groonga::params'] ->
    Class['groonga::setuprepo'] ->
    Class['groonga::install']
}
