# The following snippet creates a file /etrc/cron.d/testfubbel
# which will execute /bin/echo foo every minute
#
# e.g.
# 1 *   *   *   *   /bin/echo foo

crond { 'testfubbel':
    minute      => 1,
    command     => ['/bin/echo foo']
}
