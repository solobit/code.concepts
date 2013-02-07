
var Validator = require('node-document-validator');

module.exports = Validator.Spec('JSONSchema', {
  module: require('..'),
  engine: require('json-schema'),
  options: {}
});
