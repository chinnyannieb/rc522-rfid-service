#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#install
rm -rf /otp/services/rfid
mkdir -p /opt/services/rfid
cp -r ./* /opt/services/rfid
rm /otp/services/rfid/bin/install.sh

#add to autostart
cp bin/rfid.sh /etc/init.d/rfid
chmod +x /etc/init.d/rfid 
update-rc.d rfid defaults


