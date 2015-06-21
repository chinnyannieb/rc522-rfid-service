#!/bin/sh
### BEGIN INIT INFO
# Provides:          rfid
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     false
# Short-Description: Start rfid daemon at boot time
# Description:       Enable rfid service provided by daemon.
### END INIT INFO

DESC="Enable rfid service provided by daemon."
NAME=rfid
#DAEMON=

do_start()
{
   if $RFID_SERVICE_PID
   then
     echo "The process is run"
     exit 1
   fi
   node /opt/services/rfid/rfid.js &
   RFID_SERVICE_PID=$!
}

do_debug()
{
   if $RFID_SERVICE_PID
   then
     echo "The process is run (--debug)"
     exit 1
   fi
   node /opt/services/rfid/rfid.js --debug &
   RFID_SERVICE_PID=$!
}

do_stop()
{
   if $RFID_SERVICE_PID
   then
     echo "No run process"
     exit 1
   fi
   kill -9 $RFID_SERVICE_PID
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

