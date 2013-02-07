require('sugar');
var util = require('util');

// HACK: ...until Node.js `require` supports `instanceof` on modules loaded more than once. (bug in Node.js)
var Validator = global.NodeDocumentValidator || (global.NodeDocumentValidator = require('node-document-validator'));

// -----------------------
//  DOCS
// --------------------
//  - https://github.com/kriszyp/json-schema

// -----------------------
//  Constructor
// --------------------

// new JSONSchema ()
// new JSONSchema (options)
function JSONSchema () {
  var self = this;

  self.klass = JSONSchema;
  self.klass.super_.apply(self, arguments);

  self.engine = require('json-schema');
}

util.inherits(JSONSchema, Validator);

// -----------------------
//  Class
// --------------------

JSONSchema.defaults = {
  options: {}
};

JSONSchema.options = Object.clone(JSONSchema.defaults.options, true);

JSONSchema.reset = Validator.reset;

// -----------------------
//  Instance
// --------------------

// #validate (attributes)
// #validate (attributes, options)
// #validate (attributes, callback)
// #validate (attributes, options, callback)
JSONSchema.prototype.validate = function() {
  var self = this;

  self._validate(arguments, function(attributes, schema, options, done) {
    var result = self.engine.validate(attributes, schema);

    var errors = (result.errors || []).length ? result.errors : null;
    var valid = result.valid;

    done(errors, valid);
  });
};

// -----------------------
//  Export
// --------------------

module.exports = JSONSchema;
