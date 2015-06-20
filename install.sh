#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#install
mkdir -p /opt/services/rfid
cp -r ./* /opt/services/rfid

bower install --allow-root --config.directory=/opt/services/rfid
npm install --nodedir=/opt/services/rfid

cp bin/rfid.sh /rtc/init.d/rfid
update-rc.d apache2 defaults


