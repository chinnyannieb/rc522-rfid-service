# rc522-rfid-service

The service to user rfid device as a service. It make possible:
 - separate rfid module
 - run & test your script on other devices
 - run driver service & script with difrent users and permissions 
 
# Install
```
git clone https://github.com/SebastianPozoga/rc522-rfid-service.git
cd rc522-rfid-service
make build
make install
```

needs:
 - Bower
 - Nodejs v0.12.x (or later)
 - Npm
 - make (or you can run: bash -x bin/build.sh & bash -x bin/install.sh)
 
# Service
You can use service like:
```
sudo service rfid start/stop/debug/restart
```

# Standalone
If you want run the script without install you can use:
```
node rfid.js [optional args]
```
Arguments:
 - **--debug** - to show web debug console (default on 8088 port)
 - **--config=$path** - to change config path 

# Usage
You can connect to the service by socket.io (or other socket library). Default port is 8088.
```
io.on('tap', function(data) {
  console.log(data.rfid);
});
```

# Example
https://github.com/SebastianPozoga/rc522-rfid-service/tree/master/debug
