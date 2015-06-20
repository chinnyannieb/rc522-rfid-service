var server = require('socket.io'),
    rc522 = require("rc522-rfid");

var IOServer = module.exports = function(config, app){
    this.init(config, app);
};

IOServer.prototype.init = function(config, app){
    this.io = app ? server(app, config) : server(config);
};

IOServer.prototype.start = function(config, app){
    //send rfc ids
    rc522(function(rfid){
        console.log("rfid:", rfid);
        this.io.emit('tap', { rfid: 'rfid' });
    });
};

