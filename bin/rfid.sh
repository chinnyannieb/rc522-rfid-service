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
FILEPATH=/tmp/services/rfid
LOGPATH=/var/log/rfid.log
#DAEMON=
  
do_start()
{
   if [ -f $1 ]
   then 
     echo "The process is alredy run"
     exit 1
   fi
   node /opt/services/rfid/rfid.js >> $2 &
   echo $! > $1
   echo "Run RFID service with pid `cat $1`"   
}  


do_debug()
{
      if [ -f $1 ]
   then
     echo "The process is alredy run"
     exit 1
   fi
   node /opt/services/rfid/rfid.js --debug >> $2 &
   echo $! > $1
   echo "Run RFID service with pid `cat $1`"
}

do_stop()
{
   echo $1
   if [ ! -f $1 ]
   then
     echo "No run process"
     exit 1
   fi
   kill -9 `cat $1`
   rm $1
}

#init data directory
mkdir -p /tmp/services

case "$1" in
   start)
     do_start $FILEPATH $LOGPATH
     ;;
   stop)
     do_stop $FILEPATH $LOGPATH
     ;;
   debug)
     do_debug $FILEPATH $LOGPATH
     ;;
   restart|reload|condrestart)
     do_stop $FILEPATH $LOGPATH
     do_start $FILEPATH $LOGPATH
     ;;
   *)
     echo $"Usage: $0 {start|debug|stop|restart|reload|status}"
     exit 1
esac

exit 0

