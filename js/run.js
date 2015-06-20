var config = require('../config/config.json'),
    IOServer = require('./IOServer'),
    ioServer = new IOServer(config);

ioServer.start();
