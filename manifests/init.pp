# Define to create files in /etc/cron.d
define crond (
    $command,
    $ensure         = present,
    $user           = 'root',
    $environment    = undef,
    $minute         = '*',
    $hour           = '*',
    $month          = '*',
    $monthday       = '*',
    $weekday        = '*',
    ) {

    file { "/etc/cron.d/${name}":
        ensure  => $ensure,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('crond/crond_entry.erb'),
    }
}
