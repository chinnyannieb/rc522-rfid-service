
module.exports.log = function(msg, args){
    var i, out = [], argstr = "";
    if(args) {
        for(i=0; i<args.length; i++){
            out.push(JSON.stringify(args[i]));
        }
        argstr = " " + out.join(", ");
    }
    console.log(" *["+new Date()+"] " + msg + argstr);
}


console.log("----------------------");
console.log("----- Start app ------");
console.log("----------------------");
