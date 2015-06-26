
module.exports.log = function(msg, args){
    var i, out = [];
    for(i=0; i<args.length; i++){
        out.push(JSON.stringify(args[i]));
    }
    console.log(" *["+new Data()+"] "+msg+" "+args.join(", "));
}


console.log("----------------------");
console.log("----- Start app ------");
console.log("----------------------");
