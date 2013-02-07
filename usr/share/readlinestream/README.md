#ReadLineStream
... is a Node.js module to read a file line by line.

##Intsallation
`npm install readlinestream`

In your file:

```javascript
var rls = require("readlinestream");
var stream = rls.createReadStream("eitel.txt");
stream.on("line", function(line) {
	console.log("Line: " + line);
});
```
