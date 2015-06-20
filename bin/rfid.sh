#!/bin/sh
### BEGIN INIT INFO
# Provides:          testone
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     false
# Short-Description: Example init script
# Description:       Start/stop an example script
### END INIT INFO

DESC="test script"
NAME=testone
#DAEMON=

do_start()
{
   node /opt/services/rfid/rfid.js&
}

do_debug()
{
   node /opt/services/rfid/rfid.js --debug
}

do_stop()
{
   node /opt/services/rfid/rfid.js
}


case "$1" in
   start)
     do_start
     ;;
   stop)
     do_stop
     ;;
   debug)
     do_stop
     do_debug
     ;;
   restart|reload|condrestart)
     do_stop
     do_start
     ;;
   *)
     echo $"Usage: $0 {start|debug|stop|restart|reload|status}"
     exit 1
esac

exit 0