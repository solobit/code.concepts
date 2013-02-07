var fs = require("fs"),
    path = require("path"),
    events = require("events"),
    eol = require("os").EOL;

function ReadLineStream(p, opt) {
    
    /** --- OPTIONS --- **/
    var options = opt || {};
    var EOL = options.EOL || eol;
    
    /** --- EVENT EMITTER --- **/
    var e = new events.EventEmitter;
    
    /** --- STREAM --- **/
    var s = fs.createReadStream(path.join(path.dirname(module.parent.parent.filename), p), options);
    
    /** --- FUNCTIONALITY --- **/
    var remaining = "";
    s.on("data", function(data) {
        
        // Convert buffer to string
        data = remaining + data.toString();
        
        // If newline inside
        if(data.indexOf(EOL) !== -1) {
            
            // Split by line
            var splited = data.split(EOL);
            for(var i = 0; i < splited.length; i++) {
                // If last element
                if(i === (splited.length - 1)) {
                    remaining = splited[i];
                } else {
                    // Fire event
                    e.emit("line", splited[i]);
                }
            }
        } else {
            remaining = data;
        }
    }).on("end", function() {
        // If something is remaining
        if(remaining !== "") e.emit("line", remaining);
        
        e.emit("end");
    }).on("close", function() {
        e.emit("close");
    }).on("error", function(excep) {
        e.emit("error", excep);
    });
    
    this.destroy = function() {
        s.destroy();
    };
    
    return e;
}

// Export
module.exports = ReadLineStream;