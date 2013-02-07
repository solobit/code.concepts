module.exports = {
    ReadLineStream : require(__dirname + "/lib/ReadLineStream.js"),
    createReadLineStream : function(opt, path) {
        return this.ReadLineStream(opt, path);
    }
};