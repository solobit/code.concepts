// Generated by CoffeeScript 1.4.0
var Backbone, Collection, Events, Model, QueryCollection, View, emit, log, queryEngine, _,
  __slice = [].slice,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

_ = require('underscore');

queryEngine = require('query-engine');

Backbone = queryEngine.Backbone;

log = function() {
  var args;
  args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
  args.unshift('log');
  this.emit.apply(this, args);
  return this;
};

emit = function() {
  var args;
  args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
  return this.trigger.apply(this, args);
};

Events = (function() {

  function Events() {}

  Events.prototype.log = log;

  Events.prototype.emit = emit;

  return Events;

})();

_.extend(Events.prototype, Backbone.Events);

Model = (function(_super) {

  __extends(Model, _super);

  function Model() {
    return Model.__super__.constructor.apply(this, arguments);
  }

  Model.prototype.log = log;

  Model.prototype.emit = emit;

  Model.prototype.setDefaults = function(defaults) {
    var key, set, value, _ref;
    set = {};
    for (key in defaults) {
      if (!__hasProp.call(defaults, key)) continue;
      value = defaults[key];
      if (this.get(key) === ((_ref = this.defaults) != null ? _ref[key] : void 0)) {
        set[key] = value;
      }
    }
    this.set(set);
    return this;
  };

  return Model;

})(Backbone.Model);

Collection = (function(_super) {

  __extends(Collection, _super);

  function Collection() {
    return Collection.__super__.constructor.apply(this, arguments);
  }

  Collection.prototype.log = log;

  Collection.prototype.emit = emit;

  return Collection;

})(Backbone.Collection);

View = (function(_super) {

  __extends(View, _super);

  function View() {
    return View.__super__.constructor.apply(this, arguments);
  }

  View.prototype.log = log;

  View.prototype.emit = emit;

  return View;

})(Backbone.View);

QueryCollection = (function(_super) {

  __extends(QueryCollection, _super);

  function QueryCollection() {
    return QueryCollection.__super__.constructor.apply(this, arguments);
  }

  QueryCollection.prototype.log = log;

  QueryCollection.prototype.emit = emit;

  QueryCollection.prototype.Collection = QueryCollection;

  return QueryCollection;

})(queryEngine.QueryCollection);

module.exports = {
  queryEngine: queryEngine,
  Backbone: Backbone,
  Events: Events,
  Model: Model,
  Collection: Collection,
  View: View,
  QueryCollection: QueryCollection
};
