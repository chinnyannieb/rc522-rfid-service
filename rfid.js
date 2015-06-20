var args = {
        isDebug: false
    };

process.argv.forEach(function (val, index, array) {
    if(val=="--debug"){
        args.isDebug = true;
    }
});

if(args.isDebug){
    require('./js/debug');
}else{
    require('./js/run');
}
