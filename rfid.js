var vanilia = require("./js/vanilia"),
    IOServer = require('./IOServer'),
    args = {
        isDebug: false,
        configPath: "./config/config.json"
    }, i;

//decode arguments
for (i = 0; i < process.argv.length; i++) {
    if (process.argv[i] == "--debug") {
        args.isDebug = true;
    }
    if (vanilia.startsWith(process.argv[i], "--config")) {
        var arg = process.argv[i].split("=", 2);
        args.config = arg[1];
    }
}

//run
if (args.isDebug) {
    //run debug
    var config = require(args.configPath),
        express = require('express'),
        app = express(),
        server = require('http').Server(app),
        ioServer = new IOServer(config, server);
    app.use('/', express.static('debug'));
    server.listen(config.port);
    ioServer.start();
} else {
    //run light service
    var config = require(args.configPath),
        ioServer = new IOServer(config);
    ioServer.start();
}
