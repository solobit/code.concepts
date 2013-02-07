http = require 'http'

http.createServer @(req, res)
  res.writeHead (200, 'Content-type': 'text/plain')
  res.end "Hello \n world"
.listen (1337, "127.0.0.1")

console.log 'Server running at http://127.0.0.1:1337/'

