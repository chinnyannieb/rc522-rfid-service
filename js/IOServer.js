var server = require('socket.io'),
    rc522 = require("rc522-rfid"),
    logger = require("./logger");

var IOServer = module.exports = function(config, app){
    logger.log("init IOServer", [config, app]);
    this.init(config, app);
};

IOServer.prototype.init = function(config, app){
    this.io = app ? server(app, config) : server(config);
};

IOServer.prototype.start = function(config, app){
    var that = this;
    logger.log("start IOServer");
    rc522(function(rfid){
        logger.log("tap rfid", [rfid]);
        that.io.emit('tap', { rfid: 'rfid' });
    });
};

