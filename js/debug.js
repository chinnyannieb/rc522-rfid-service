var config = require('../config/config.json'),
    IOServer = require('./IOServer'),
    express = require('express'),
    app = express(),
    server = require('http').Server(app),
    ioServer = new IOServer(config, server);

app.use('/', express.static('debug'));
server.listen(config.port);
ioServer.start();
