nconf = require("nconf")

#
# 1. any overrides
#
nconf.overrides always: "be this value"

#
# 2. `process.env`
# 3. `process.argv`
#
nconf.env().argv()

#
# 4. Values in `config.json`
#
nconf.file "/path/to/config.json"

#
# Or with a custom name
#
nconf.file "custom", "/path/to/config.json"

#
# Or searching from a base directory.
# Note: `name` is optional.
#
nconf.file name,
  file: "config.json"
  dir: "search/from/here"
  search: true


#
# 5. Any default values
#
nconf.defaults "if nothing else": "use this value"
